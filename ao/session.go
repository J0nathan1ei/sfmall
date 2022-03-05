package ao

import (
	"encoding/base64"
	"fmt"
	"sfmall/common"
)

// 维护登录信息的session表
var LoginMap map[string]LoginStruct = make(map[string]LoginStruct)


// 用户登录后，维护的已有信息
type LoginStruct struct{
	UserName string
	UserInfo *common.User
}


// 生成sessionId
func genSessionId(srcKey string) string {
	key := []byte(srcKey)
	return base64.URLEncoding.EncodeToString(key)
}


// 登录时，填充session信息
func FillLoginInfo(user *common.User)string{
	cookieSrc := user.Id[len(user.Id)-10:] + user.LoggedInTime

	sessionId := genSessionId(cookieSrc)
	fmt.Println("sessionId: ", sessionId)
	LoginMap[sessionId] = LoginStruct{
		user.UserName,
		user,
	}
	return cookieSrc
}


