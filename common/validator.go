package common

import (
	"bytes"
	"github.com/go-playground/locales/zh"
	"github.com/go-playground/universal-translator"
	"github.com/go-playground/validator/v10"
	zh_translations "github.com/go-playground/validator/v10/translations/zh"
	"regexp"
)

var ParamsValidator *validator.Validate
var Trans *ut.Translator


// 初始化参数校验机制
func InitValidator(){
	ParamsValidator = validator.New()
	err := ParamsValidator.RegisterValidation("ParamsValidation", ParamsValidation)
	if err != nil{
		Logger.Error("RegisterValidation Failed: ", err)
	}

	//注册翻译器
	initTranslator()
	err = zh_translations.RegisterDefaultTranslations(ParamsValidator, *Trans)
	if err != nil {
		Logger.Error("RegisterDefaultTranslations Failed: ", err)
	}
}


// 初始化翻译器
func initTranslator(){
	uni := ut.New(zh.New())
	zhTrans, _ := uni.GetTranslator("zh")
	Trans = &zhTrans
}


// 参数校验器
func ParamsValidation(fl validator.FieldLevel) bool {
	if str, ok := fl.Field().Interface().(string); ok {
		if str == "" {
			return true
		}
		regex := "^[^\\^~!#$%&\\*\\\\\\|<>?\\\"'\\(\\)\\+{}`]*$"
		r := bytes.NewReader([]byte(str))
		isMatch, err := regexp.MatchReader(regex, r)
		if err != nil {
			Logger.Error("请求包含非法字符：", str)
			return false
		}
		if !isMatch {
			return false
		}
	}
	return true
}
