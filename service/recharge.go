package service

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sfmall/ao"
	"sfmall/common"
)

func HandleRecharge(writer http.ResponseWriter, request *http.Request){
	var params common.ReqRecharge
	var rechargeResponse common.Response
	var retBytes []byte
	var err error

	// 返回值设置为json型
	writer.Header().Set("content-type","text/json")
	// 解析登录请求
	reqStr := make([]byte, request.ContentLength)
	request.Body.Read(reqStr)
	err = json.Unmarshal(reqStr, &params)
	if err != nil{
		rechargeResponse.Success = false
		rechargeResponse.Msg = "输入参数有误：" + err.Error()
		goto END
	}

	// ao层业务处理
	err = ao.RechargeUser(params)
	if err != nil{
		rechargeResponse.Success = false
		rechargeResponse.Msg = err.Error()
	}

	rechargeResponse.Success = true
	rechargeResponse.Msg = "充值成功喽!"
END:
	retBytes, err = json.Marshal(rechargeResponse)
	if err != nil{
		common.Logger.Error("json marshaled failed")
		fmt.Fprintf(writer, "服务器内部错误")
	}
	fmt.Fprintf(writer, string(retBytes))
}