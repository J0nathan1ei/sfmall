package main

import (
	"sfmall/ao"
	"sfmall/common"
	"sfmall/dao"
	"sfmall/service"
)

func initAll(){
	common.InitLogger()
	dao.Init()
	ao.Init()
}

func uninitAll(){
	ao.Unit()
	dao.UnInit()
}


func main(){
	initAll()
	defer uninitAll()
	service.MainServer()
}