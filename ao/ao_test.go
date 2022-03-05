package ao

import (
	"fmt"
	"sfmall/common"
	"sfmall/dao"
	"testing"
)

// 测试ao业务初始化
func TestInit(t *testing.T) {
	Init()
	if AllProductsInfo == nil{
		t.Errorf("ao service init failed!")
	}
}

// 测试用户注册
func TestRegister(t *testing.T) {
	testReqRegister := common.ReqRegister{
		UserName: "jonathan",
		RealName: "jonathan",
		Password: "hello123",
		RePassword: "hello123",
		Phone: "15555555555",
	}
	ret, err := Register(testReqRegister)
	if err != nil{
		t.Errorf("user register failed!")
	}
	fmt.Println(ret)
}

// 测试用户登录
func TestLogin(t *testing.T) {
	testReqLogin := common.ReqLogin{
		UserName: "jonathan",
		Password: "hello123",
	}

	ret, err := Login(testReqLogin)
	if err != nil{
		t.Errorf("user login failed")
	}
	fmt.Println(ret)
}

// 测试新增地址
func TestAddAddress(t *testing.T) {
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
	testReqAddAddress := common.ReqAddAddress{
		Province: "xxx",
		City:"yyy",
		District: "zzz",
		DetailedAddr: "aaa",
		PostalCode: 200000,
		IsDefault: 0,
	}
	ret, err := AddAddress(&testUser, testReqAddAddress)
	if err != nil{
		t.Errorf("test add address failed!")
	}
	fmt.Println(ret)
}

// 测试用户查询
func TestQueryUser(t *testing.T) {
	ret := QueryUser("jonathan")
	if ret == nil{
		t.Errorf("query user failed")
	}
	fmt.Println(ret)
}

// 测试购买商品
func TestBuyProducts(t *testing.T) {
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
		LoggedInTime: "2022-01-01 12:05:00",
	}
	testBuyingItems := map[string]interface{}{
		"9":1.0,
		"10":1.0,
	}
	ret, err := BuyProducts(&testUser, testBuyingItems)
	if err!=nil{
		t.Errorf("buying item failed!")
	}
	fmt.Println(ret)
}


// 测试用户session生成
func TestFillLoginInfo(t *testing.T) {
	testUser := common.User{
		Id:           "12345678910123",
		UserName:     "jonathan",
		RealName:     "jonathan",
		RoleId:       1,
		Password:     "admin123",
		Phone:        "13355556666",
		Balance:      5000.0,
		Status:       1,
		Created:      "2022-01-01 12:00:00",
		Updated:      "2022-01-01 12:00:00",
		LoggedInTime: "2022-01-01 12:05:00",
	}
	ret := FillLoginInfo(&testUser)
	if len(ret) == 0{
		t.Errorf("fill user login info failed!")
	}
}

// 测试商品展示
func TestShowProducts(t *testing.T) {
	productsInfo := ShowProducts()
	if len(productsInfo) == 0{
		t.Errorf("get products info failed!")
	}
}

// 测试根据用户ID获取地址id
func TestGetAddressIdByUserId(t *testing.T) {
	ret := GetAddressIdByUserId("888888")
	if ret == -1{
		t.Errorf("get AddressId by UserId failed")
	}
}


// 测试ao业务反初始化，置空商品信息
func TestUnit(t *testing.T) {
	Unit()
	if AllProductsInfo != nil{
		t.Errorf("ao service uninit failed!")
	}
}

func TestMain(m *testing.M){
	common.InitLogger()
	dao.Init()
	m.Run()
}
