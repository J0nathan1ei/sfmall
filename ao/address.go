package ao

import (
	"fmt"
	"sfmall/common"
	"sfmall/dao"
	"strconv"
)

var CurAddressId int

func AddAddress(user *common.User, params common.ReqAddAddress)(string, error){
	var address common.Address
	var retStr string

	address.UserId = user.Id
	address.Name = user.UserName
	address.Mobile = user.Phone
	address.PostalCode = params.PostalCode
	address.Province = params.Province
	address.City = params.City
	address.District = params.District
	address.DetailedAddress = params.DetailedAddr
	address.IsDefault = params.IsDefault
	address.Created = common.GetTimeToS()

	dao.InsertAddressData(address)

	retStr = "新增地址成功！"
	return retStr, nil
}


func GetAddressIdByUserId(userId string) int{
	var ret int
	var err error

	queryStr := fmt.Sprintf("SELECT id FROM address WHERE address.user_id='%s'", userId)
	m := dao.QueryData(queryStr)
	if m == nil{	// 不存在收货地址
		ret = -1
		goto END
	}

	ret, err = strconv.Atoi(m[0]["id"])
	if err != nil{
		common.Logger.Error("id convert failed!")
		return -1
	}

END:
	return ret
}

