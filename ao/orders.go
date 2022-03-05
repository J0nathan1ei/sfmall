package ao

import (
	"errors"
	"fmt"
	"sfmall/common"
	"sfmall/dao"
	"strconv"
	"sync"
)

var orderStatus0 string = "待发货"
//var orderStatus1 string = "配送中"

var lock sync.Mutex
func BuyProducts(user *common.User, params map[string]interface{})(string, error){
	var price float64
	var retStr string
	var err error
	var order common.Order

	order.AddressId = GetAddressIdByUserId(user.Id)
	if order.AddressId == -1{
		retStr = "当前用户没有收货地址，请添加！"
		err = errors.New("USER HAVE NO ADDRESS")
		return retStr, err
	}

	// 购买进行时加锁
	lock.Lock()
	for key, val := range params {
		id, _:= strconv.Atoi(key)
		buyingNum := int(val.(float64))
		// 更新购买记录
		order.ProductItem += key + ","
		// 计算总价
		price += AllProductsInfo[id].price * val.(float64)
		// 更新剩余和已售数目
		AllProductsInfo[id].amount -= buyingNum
		AllProductsInfo[id].sales += buyingNum
	}
	fmt.Printf("price: %f\n", price)

	user.Balance = user.Balance - price
	if user.Balance < 0{
		retStr = "当前用户余额不足，请充值！"
		err = errors.New("USER MONEY NOT ENOUGH")
		return retStr, err
	}
	order.TotalPrice = price
	order.Status = orderStatus0
	order.AddressId = GetAddressIdByUserId(user.Id)
	order.UserId = user.Id
	order.NickName = user.UserName
	order.Created = common.GetTimeToS()

	// 更新order表
	dao.InsertOrdersData(order)
	// 更新用户表的用户余额
	dao.UpdateBalance(user.Id, user.Balance, order.Created)
	// 更新物品表的剩余数量和已售数目
	updateOrderStr := UpdateProductStr(params, AllProductsInfo)
	dao.UpdateProductInOrder(updateOrderStr)

	// 购买结束后解锁
	lock.Unlock()

	retStr = fmt.Sprintf("购买成功，已付款：%.2f元，您的当前余额为%.2f元", price, user.Balance)
	return retStr, nil
}


// 构造更新product表的字段
func UpdateProductStr(params map[string]interface{}, productsInfo map[int]*ProductShortInfo)string{
	updateStr := "UPDATE product SET amount=CASE product.id "
	for key, _ := range params{
		id, _:= strconv.Atoi(key)
		updateStr += fmt.Sprintf("WHEN %s THEN %d ", key, productsInfo[id].amount)
	}
	updateStr += "END, sales=CASE product.id "
	for key, _ := range params{
		id, _:= strconv.Atoi(key)
		updateStr += fmt.Sprintf("WHEN %s THEN %d ", key, productsInfo[id].sales)
	}
	updateStr += "END WHERE product.id IN ("
	for key, _ := range params{
		updateStr += fmt.Sprintf("%s,",key)
	}
	updateStr = updateStr[:len(updateStr)-1] + ")"
	//fmt.Println(updateStr)
	return updateStr
}