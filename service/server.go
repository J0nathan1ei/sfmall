package service

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sfmall/ao"
	"sfmall/common"
)
type CommonParams	map[string]interface{}
type CommonResponse map[string]interface{}

// 单层json参数解析，结果放到map中
func SingleParamsParse(request *http.Request, m *CommonParams){
	decoder := json.NewDecoder(request.Body)
	decoder.Decode(m)
}


// map型结构体转为json字符串
func MapToString(m map[string]interface{})string{
	res, _ := json.Marshal(m)
	return string(res)
}


// 检查是否登录，返回对应的用户信息
func GetLoggedInUser(request *http.Request)*common.User{
	cookie := request.Header.Get("Cookie")
	_, ok := ao.LoginMap[cookie]
	if !ok {
		common.Logger.Warn("当前账户未登录，请登录！")
		return nil
	}
	return ao.LoginMap[cookie].UserInfo
}


// 主页显示内容
func HelloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, Welcome to SF-Mall!")
}


func handleGet(writer http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()

	// 第一种方式
	// id := query["id"][0]

	// 第二种方式
	id := query.Get("id")
	fmt.Printf("GET: id=%s\n", id)
	fmt.Fprintf(writer, `{"code":0}`)
}


func handlePostJson(writer http.ResponseWriter, request *http.Request) {
	// 用于存放参数key=value数据
	var params CommonParams
	SingleParamsParse(request, &params)

	fmt.Printf("POST json: username=%s, password=%s\n", params["username"], params["password"])
	fmt.Fprintf(writer, `{"code":0}`)
}


func MainServer(){
	http.HandleFunc("/", HelloHandler)
	http.HandleFunc("/testGet", handleGet)
	http.HandleFunc("/testPostJson", handlePostJson)
	http.HandleFunc("/login", HandleLogin)
	http.HandleFunc("/register", HandleRegister)
	http.HandleFunc("/addAddress", HandleAddAddress)
	http.HandleFunc("/getProducts", HandleGetProducts)
	http.HandleFunc("/buyProducts", HandleBuyProducts)
	http.HandleFunc("/recharge", HandleRecharge)
	http.ListenAndServe(":8000", nil)
}
