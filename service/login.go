package service

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sfmall/ao"
	"sfmall/common"
)


func HandleLogin(writer http.ResponseWriter, request *http.Request){
	var params common.ReqLogin
	var loginResponse common.Response
	var retBytes []byte
	var err error

	// 返回值设置为json型
	writer.Header().Set("content-type","text/json")
	// 解析登录请求
	reqStr := make([]byte, request.ContentLength)
	request.Body.Read(reqStr)
	err = json.Unmarshal(reqStr, &params)
	if err != nil{
		loginResponse.Success = false
		loginResponse.Msg = "输入参数有误：" + err.Error()
	}

	// 参数检查
	if params.UserName == "" || params.Password == ""{
		loginResponse.Success = false
		loginResponse.Msg = "参数不能为空！"
		goto END
	}

	// 登录处理
	loginResponse.Msg, err =ao.Login(params)
	if err != nil{
		loginResponse.Success= false
	} else {
		loginResponse.Success = true
	}

END:
	retBytes, err = json.Marshal(loginResponse)
	if err != nil{
		common.Logger.Error("json marshaled failed")
		fmt.Fprintf(writer, "服务器内部错误")
	}
	fmt.Fprintf(writer, string(retBytes))
}


func HandleAddAddress(writer http.ResponseWriter, request *http.Request){
	var params common.ReqAddAddress
	var addressResponse common.Response
	var retBytes []byte
	var err error
	var user *common.User

	// 返回值设置为json型
	writer.Header().Set("content-type","text/json")
	// 解析地址添加请求
	reqStr := make([]byte, request.ContentLength)
	request.Body.Read(reqStr)
	err = json.Unmarshal(reqStr, &params)
	if err != nil{
		addressResponse.Success = false
		addressResponse.Msg = "输入参数有误：" + err.Error()
		goto END
	}

	// 检查用户是否已登录
	user = GetLoggedInUser(request)
	if user == nil {
		addressResponse.Success = false
		addressResponse.Msg = "当前用户未登录！"
		goto END
	}

	// 检查参数
	if params.Province == "" || params.City == "" || params.District == "" ||
		params.DetailedAddr == "" || params.PostalCode <= 0  ||
		params.IsDefault != 0 && params.IsDefault != 1{
		addressResponse.Success = false
		addressResponse.Msg = "输入参数有误，请重新输入！"
		goto END
	}

	// 登录处理
	addressResponse.Msg, err =ao.AddAddress(user, params)
	if err != nil{
		addressResponse.Success = false
	} else {
		addressResponse.Success = true
	}

END:
	retBytes, err = json.Marshal(addressResponse)
	if err != nil{
		common.Logger.Error("json marshaled failed")
		fmt.Fprintf(writer, "服务器内部错误")
	}
	fmt.Fprintf(writer, string(retBytes))
}
