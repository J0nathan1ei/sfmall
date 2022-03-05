package service

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sfmall/ao"
	"sfmall/common"
)



func HandleRegister(writer http.ResponseWriter, request *http.Request){
	var params common.ReqRegister
	var registerResponse common.Response
	var retBytes []byte
	var err error

	// 返回值设置为json型
	writer.Header().Set("content-type","text/json")
	// 解析地址添加请求
	reqStr := make([]byte, request.ContentLength)
	request.Body.Read(reqStr)
	err = json.Unmarshal(reqStr, &params)
	if err != nil{
		registerResponse.Success = false
		registerResponse.Msg = "输入参数有误：" + err.Error()
	}

	// 参数校验
	if params.UserName == "" || params.RealName == "" || params.Phone == "" ||
		params.Password == "" || params.RePassword == ""{
		registerResponse.Success = false
		registerResponse.Msg = "输入参数不能为空！"
		goto END
	}
	if params.Password != params.RePassword{
		registerResponse.Success = false
		registerResponse.Msg = "两次密码不一致，请重新输入！"
		goto END
	}

	// 注册用户
	registerResponse.Msg, err = ao.Register(params)
	if err != nil{
		registerResponse.Success = false
	} else {
		registerResponse.Success = true
	}

END:
	retBytes, err = json.Marshal(registerResponse)
	if err != nil{
		common.Logger.Error("json marshaled failed")
		fmt.Fprintf(writer, "服务器内部错误")
	}
	fmt.Fprintf(writer, string(retBytes))
}