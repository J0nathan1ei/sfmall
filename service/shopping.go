package service

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sfmall/ao"
	"sfmall/common"
)

var buyingResponse CommonResponse = make(CommonResponse)

func HandleGetProducts(writer http.ResponseWriter, request *http.Request){
	// 返回值设置为json型
	writer.Header().Set("content-type","text/json")
	//if GetLoggedInUser(request) == nil{
	res := ao.ShowProducts()
	fmt.Fprintf(writer, res)
	//}
}


func HandleBuyProducts(writer http.ResponseWriter, request *http.Request)  {
	var params common.ReqBuyRequest
	var retBuying	common.Response
	var retBytes []byte
	var user *common.User
	var err error

	// 返回值设置为json型
	writer.Header().Set("content-type","text/json")
	// 解析购买请求
	reqStr := make([]byte, request.ContentLength)
	request.Body.Read(reqStr)
	json.Unmarshal(reqStr, &params)

	// 检查用户是否已登录
	user = GetLoggedInUser(request)
	if user == nil{
		retBuying.Success = false
		retBuying.Msg = "当前用户未登录！"
		goto END
	}

	// 参数校验
	if params.BuyingItems == nil{
		retBuying.Success = false
		retBuying.Msg = "参数为空"
		goto END
	}

	retBuying.Msg, err = ao.BuyProducts(user, params.BuyingItems)
	if err != nil{
		retBuying.Success = false
	} else {
		retBuying.Success = true
	}

END:
	retBytes, err = json.Marshal(retBuying)
	if err != nil{
		common.Logger.Error("json marshaled failed")
		fmt.Fprintf(writer, "服务器内部错误")
	}
	fmt.Fprintf(writer, string(retBytes))
}