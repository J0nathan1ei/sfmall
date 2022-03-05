package dao

import (
	"sfmall/common"
	"testing"
)

// 测试数据库初始化连接
func TestInit(t *testing.T) {
	if DB == nil {
		t.Error("Mysql init failed!")
	}
}

// 测试常规数据查询
func TestQueryData(t *testing.T) {
	ret := QueryData("SELECT * FROM user")
	if len(ret) == 0 {
		t.Error("QueryData failed!")
	}
}

// 测试用户数据插入
func TestInsertUserData(t *testing.T) {
	testUser := common.User{
		Id:           "888888",
		UserName:     "jonathan",
		RealName:     "jonathan",
		RoleId:       1,
		Password:     "admin123",
		Phone:        "13355556666",
		Balance:      5000.0,
		Status:       1,
		Created:      "2022-01-01 12:00:00",
		Updated:      "2022-01-01 12:00:00",
		LoggedInTime: "",
	}
	ret := InsertUserData(testUser)
	if !ret { //注：用户已存在时无法插入，正常情况
		info := QueryData("SELECT * FROM user WHERE user.id='888888'")
		if info == nil {
			t.Error("insert user failed!")
		}
	}
}

//
func TestInsertAddressData(t *testing.T) {
	testAddress := common.Address{
		UserId:          "888888",
		Name:            "jonathan",
		Mobile:          "15555556666",
		PostalCode:      100000,
		Province:        "xxx",
		City:            "yyy",
		District:        "zzz",
		DetailedAddress: "hhh",
		IsDefault:       0,
		Created:         "2022-01-01 12:00:00",
		Updated:         "2022-01-01 12:00:00",
	}
	if !InsertAddressData(testAddress) {
		info := QueryData("SELECT * FROM address WHERE address.user_id='888888'")
		if info == nil {
			t.Error("insert address failed!")
		}
	}
}

// 测试插入订单数据
func TestInsertOrdersData(t *testing.T) {
	var testOrder = common.Order{
		ProductItem: "9,10",
		TotalPrice:  10,
		Status:      "待发货",
		AddressId:   2000,
		UserId:      "888888",
		NickName:    "jonathan",
		Created:     "2022-01-01 12:05:00",
		Updated:     "2022-01-01 12:05:00",
	}
	if !InsertOrdersData(testOrder) {
		info := QueryData("SELECT * FROM orders WHERE orders.user_id='888888'")
		if info == nil {
			t.Error("insert address failed!")
		}
	}
}

// 测试检查充值卡合法性
func TestQueryRechargeCard(t *testing.T) {
	testValid := QueryRechargeCard("100005")   // 数据库内已存在
	testInvalid := QueryRechargeCard("200000") // 数据库中不存在
	if !testValid || testInvalid {
		t.Error("query recharge card failed!")
	}
}

// 测试检查用户存在性
func TestQueryUserExists(t *testing.T) {
	testValid := QueryUserExists("jonathan")  // 数据库内已存在
	testInvalid := QueryUserExists("xxxxxxx") // 数据库中不存在
	if !testValid || testInvalid {
		t.Error("query user existence failed!")
	}
}

// 测试更新用户余额
func TestUpdateBalance(t *testing.T) {

}

// 测试数据库反初始化并关闭
func TestUnInit(t *testing.T) {
	common.InitLogger()
	Init()
	UnInit()
	if DB != nil {
		t.Error("Mysql uninit failed!")
	}
}

func TestMain(m *testing.M) {
	common.InitLogger()
	Init()
	m.Run()
}
