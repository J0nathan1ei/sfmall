package ao

import (
	"encoding/json"
	"sfmall/common"
	"sfmall/dao"
	"strconv"
)


type ProductShortInfo struct{
	title       string
	description string
	price       float64
	amount      int
	sales       int
}

var AllProductsInfo map[int]*ProductShortInfo = make(map[int]*ProductShortInfo)

func ProductsInit(){
	m := dao.QueryData("SELECT id, amount, price, description, title, sales FROM product")
	length := len(m)
	for i := 0; i < length;i++{
		productId, _ := strconv.Atoi(m[i]["id"])
		productPrice, _ := strconv.ParseFloat(m[i]["price"], 64)
		productAmount, _ := strconv.Atoi(m[i]["amount"])
		productSales, _ := strconv.Atoi(m[i]["sales"])

		AllProductsInfo[productId] = &ProductShortInfo{
			m[i]["title"],
			m[i]["description"],
			productPrice,
			productAmount,
			productSales,
		}
	}
}


// 显示所有在售商品
func ShowProducts() string{
	var RetBytes []byte
	var productsInfo common.ResponseShowProducts
	productsInfo.ProductLists = make(map[string]common.SingleProductInfo)
	for key, val := range AllProductsInfo {
		productsInfo.ProductLists[strconv.Itoa(key)] = common.SingleProductInfo{
			Title:       val.title,
			Description: val.description,
			Price:       val.price,
			Amount:      val.amount,
		}
	}
	RetBytes, _ = json.Marshal(productsInfo)
	return string(RetBytes)
}

