package common

import (
	"errors"
	"fmt"
	"math/rand"
	"reflect"
	"strconv"
	"time"
)

func GetTimeToS()string{
	return time.Now().Format("2006-01-02 15:04:05")
}

func ParseStruct(a interface{})  {
	typ := reflect.TypeOf(a)
	val := reflect.ValueOf(a) //获取reflect.Type类型

	kd := val.Kind() //获取到a对应的类别
	if kd != reflect.Struct {
		fmt.Println("expect struct")
		return
	}
	//获取到该结构体有几个字段
	num := val.NumField()
	fmt.Printf("该结构体有%d个字段\n", num) //4个

	//遍历结构体的所有字段
	for i := 0; i < num; i++ {
		//获取到struct标签，需要通过reflect.Type来获取tag标签的值
		key := typ.Field(i).Name
		value := val.Field(i)
		fmt.Printf("%s: %v\n", key, value)
	}
}


// 类型转换
func ConvertType(value string, ktype string) (reflect.Value, error){
	switch ktype{
	case "string":
		return reflect.ValueOf(ktype), nil
	case "int":
		buf, err := strconv.Atoi(value)
		return reflect.ValueOf(buf), err
	case "float32":
		buf, err := strconv.ParseFloat(value, 64)
		return reflect.ValueOf(buf), err
	case "float64":
		buf, err := strconv.ParseFloat(value, 64)
		return reflect.ValueOf(buf), err
	default:
		fmt.Println("Unsupported convert type!")
		return reflect.ValueOf(nil), nil
	}
}


// 将查询出来的map转换为对应结构体
func DataToStruct(data map[string]string, ptr interface{}){
	ptype := reflect.TypeOf(ptr).Elem()
	pvalue := reflect.ValueOf(ptr).Elem()

	memberNum := pvalue.NumField()
	for i := 0; i < memberNum;i++{
		key := ptype.Field(i).Name
		value := data[ptype.Field(i).Tag.Get("sql")]
		val := reflect.ValueOf(value)

		ktype := ptype.Field(i).Type
		vtype := reflect.TypeOf(value)

		var err error
		if vtype != ktype{
			val, err = ConvertType(value, ktype.Name())
			if err != nil{
				fmt.Println("ConvertType failed!")
			}
		}
		pvalue.FieldByName(key).Set(val)
	}
}

// 生成指定区间随机数
func GenRandomNum(start int, end int)(int, error){
	if end < start{
		Logger.Errorf("section end should be bigger than section start.")
		return -1, errors.New("ERR SECTION")
	}
	rand.Seed(time.Now().UnixNano())
	return rand.Intn(end - start) + start, nil
}
