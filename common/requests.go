package common
// 所有请求定义结构体

// 登录请求
type ReqLogin struct{
	UserName	string	`json:"username"`
	Password	string	`json:"password"`
}

// 注册请求
type ReqRegister struct{
	UserName	string	`json:"username"`
	RealName	string	`json:"real_name"`
	Phone		string	`json:"phone"`
	Password	string	`json:"password"`
	RePassword	string	`json:"re_password"`
}

// 添加收货地址请求
type ReqAddAddress struct{
	Province		string	`json:"province"`
	City			string	`json:"city"`
	District		string	`json:"district"`
	DetailedAddr	string	`json:"detailed_address"`
	PostalCode		int		`json:"postal_code"`
	IsDefault		int		`json:"is_default"`
}

// 购买商品请求
type ReqBuyRequest struct {
	BuyingItems 	map[string]interface{} 	`json:"buying_items"`
}

// 充值请求
type ReqRecharge struct{
	RechargeCardId		string		`json:"recharge_card_id"`
	RechargeUser		string		`json:"recharge_user"`
}
