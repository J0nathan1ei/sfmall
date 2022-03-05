package common

// 标准请求响应
type Response struct{
	Success 	bool	`json:"success"`
	Msg			string	`json:"msg"`
}


// 单个商品的查询信息
type SingleProductInfo struct{
	Title			string	`json:"Title"`
	Description		string	`json:"Description"`
	Price			float64	`json:"Price"`
	Amount			int		`json:"Amount"`
}


// 所有商品信息查询
type ResponseShowProducts struct{
	ProductLists	map[string]SingleProductInfo
}