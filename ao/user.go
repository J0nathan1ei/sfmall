package ao

import (
	"errors"
	"fmt"
	"github.com/segmentio/ksuid"
	"sfmall/common"
	"sfmall/dao"
)

var maxLoginTimes int = 3										// 最大失败次数

func Init(){
	ProductsInit()
}

func Unit(){
	AllProductsInfo = nil
}

// 查询用户的信息，若存在则返回User结构体指针，不存在返回nil
func QueryUser(name string) *common.User{
	var RetUser common.User
	queryStr := "SELECT * FROM user WHERE user.username=" + "\"" + name + "\""
	m := dao.QueryData(queryStr)
	if m == nil{
		return nil
	}
	// parse.ParseStruct(RetUser)
	common.DataToStruct(m[0],&RetUser)
	return &RetUser
}


// 用户注册
func Register(params common.ReqRegister)(string, error){
	var user common.User
	var resStr string
	user.Id = ksuid.New().String()
	user.UserName = params.UserName
	user.RealName = params.RealName
	user.RoleId = 1
	user.Password = params.Password
	user.Phone = params.Phone
	user.Balance = 0
	user.Status = 1
	user.Created = common.GetTimeToS()
	user.LoggedInTime = ""

	dao.InsertUserData(user)
	resStr = "注册成功！"
	return resStr, nil
}


// 用户登录
func Login(params common.ReqLogin) (string, error){
	var userInDb *common.User
	var retStr string
	var err error
	failedCnt := 0
	user := params.UserName
	password := params.Password

	// 检查用户是否存在
	userInDb = QueryUser(user)
	if userInDb == nil{
		retStr = fmt.Sprintf("输入有误，用户不存在！")
		err = errors.New("User not exist!")
		return retStr, err
	}

	// 检查用户名密码
	if password != userInDb.Password && failedCnt < maxLoginTimes{
		retStr = fmt.Sprintf("密码有误，请重新输入！（剩余%d次）\n", 3 - failedCnt)
		err = errors.New("WRONG PASSWORD")
		failedCnt++
		return retStr, err
	} else if failedCnt >= maxLoginTimes{
		retStr = fmt.Sprintf(retStr, "超出登录限制次数，请稍后再试！")
		err = errors.New("OVER LIMIT")
		return retStr, err
	}

	timeNow := common.GetTimeToS()
	UpdateLogin(userInDb.Id, timeNow)	// overstep

	// 维护登录session
	retStr = FillLoginInfo(userInDb)

	//fmt.Println(LoginMap)
	return retStr, err
}


// 登录时更新登录时间
func UpdateLogin(id string, time string){
	dao.UpdateLogin(id, time)
}


//用户充值
func RechargeUser(params common.ReqRecharge) error {
	// 查询充值卡合法性
	if dao.QueryRechargeCard(params.RechargeCardId) == false{
		return errors.New("非法充值卡ID！")
	}

	// 验证用户合法性
	if dao.QueryUserExists(params.RechargeUser) == false{
		return errors.New("充值的用户不存在！")
	}

	// 使用充值卡，更新账户的余额
	if dao.UserRechargeCard(params.RechargeCardId, params.RechargeUser) == false{
		return errors.New("充值失败，请稍后重试！")
	}

	return nil
}
