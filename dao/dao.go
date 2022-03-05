package dao

import (
	"database/sql"
	"errors"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"sfmall/common"
)

type QueryRes []map[string]string
type QueryRecord map[string]string

var DB *sql.DB

// 连接数据库并初始化
func Init() bool {
	bret := false

	DB, _ = sql.Open("mysql", "root:root@tcp(127.0.0.1:3306)/sfmall")
	//设置数据库最大连接数
	DB.SetConnMaxLifetime(100)
	//设置上数据库最大闲置连接数
	DB.SetMaxIdleConns(10)
	//验证连接
	if err := DB.Ping(); err != nil {
		common.Logger.Error("open database fail")
		goto LReturn
	}

	common.Logger.Info("connect mysql success")
	bret = true
LReturn:
	return bret
}

// 反初始化，关闭数据库连接
func UnInit() {
	DB.Close()
	DB = nil
}

// 查询数据
func QueryData(queryStr string) QueryRes {
	rows, e := DB.Query(queryStr)
	defer rows.Close()
	if e != nil {
		errors.New("query incur error")
	}

	// 获取列
	cols, _ := rows.Columns()
	if len(cols) > 0 {
		var ret []map[string]string
		for rows.Next() {
			buff := make([]interface{}, len(cols))
			data := make([][]byte, len(cols)) //数据库中的NULL值可以扫描到字节中
			for i, _ := range buff {
				buff[i] = &data[i]
			}
			rows.Scan(buff...) //扫描到buff接口中，实际是字符串类型data中
			//将每一行数据存放到数组中
			dataKv := make(map[string]string, len(cols))
			for k, col := range data { //k是index，col是对应的值
				//fmt.Printf("%30s:\t%s\n", cols[k], col)
				dataKv[cols[k]] = string(col)
			}
			ret = append(ret, dataKv)
			//fmt.Println(dataKv)
		}
		return ret
	} else {
		return nil
	}
}

// 用户表插入数据
func InsertUserData(user common.User) bool {
	var err error
	var stmt *sql.Stmt

	insertUserStr := "INSERT user (id, username, real_name, role_id, password, phone, balance, status, created, updated, " +
		"logged_in_time) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
	stmt, err = DB.Prepare(insertUserStr)
	if err == nil {
		_, err = stmt.Exec(user.Id,
			user.UserName,
			user.RealName,
			user.RoleId,
			user.Password,
			user.Phone,
			user.Balance,
			user.Status,
			user.Created,
			user.Updated,
			user.LoggedInTime)
		if err != nil {
			common.Logger.Error("Insert data into user-table failed! error: ", err)
			return false
		}
	}
	return true
}

// 用户表插入数据
func InsertAddressData(address common.Address) bool {
	var err error
	var stmt *sql.Stmt

	insertUserStr := "INSERT address (user_id, name, mobile, postal_code, province, city, district, detailed_address, " +
		"is_default, created, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
	stmt, err = DB.Prepare(insertUserStr)
	if err == nil {
		_, err = stmt.Exec(address.UserId,
			address.Name,
			address.Mobile,
			address.PostalCode,
			address.Province,
			address.City,
			address.District,
			address.DetailedAddress,
			address.IsDefault,
			address.Created,
			address.Updated)
		if err != nil {
			common.Logger.Error("Insert data into address-table failed! error: ", err)
			return false
		}
	}
	return true
}

// 用户表插入数据
func InsertOrdersData(order common.Order) bool {
	var err error
	var stmt *sql.Stmt

	insertUserStr := "INSERT orders (product_item, total_price, status, address_id, user_id, nick_name, created, updated) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
	stmt, err = DB.Prepare(insertUserStr)
	if err == nil {
		_, err = stmt.Exec(order.ProductItem,
			order.TotalPrice,
			order.Status,
			order.AddressId,
			order.UserId,
			order.NickName,
			order.Created,
			order.Updated)
		if err != nil {
			common.Logger.Error("Insert data into orders-table failed! error: ", err)
			return false
		}
	}
	return true
}

// 插入充值卡数据
func InsertRechargeCard(credit float64)bool{
	var err error
	var stmt *sql.Stmt

	insertUserStr := "INSERT recharge_cards (credits)" + "VALUES(?)"
	stmt, err = DB.Prepare(insertUserStr)
	if err == nil{
		_, err = stmt.Exec(credit)
		if err != nil{
			common.Logger.Errorf("Insert data into recharge_cards failed! error: ", err)
			return false
		}
	}
	return true
}

// 更新用户登录时间
func UpdateLogin(id string, time string) bool {
	var err error
	var stmt *sql.Stmt
	preUpdateStr := "UPDATE user SET logged_in_time=? WHERE user.id=?"
	stmt, err = DB.Prepare(preUpdateStr)
	if err != nil {
		common.Logger.Error("dao UpdateLogin failed:", err)
		return false
	}
	_, err = stmt.Exec(time, id)
	if err != nil {
		common.Logger.Error("dao UpdateLogin failed:", err)
		return false
	}

	return true
}

// 更新用户余额
func UpdateBalance(id string, balance float64, updateTime string) bool {
	var err error
	var stmt *sql.Stmt
	preUpdateStr := "UPDATE user SET balance=?, updated=? WHERE user.id=?"
	stmt, err = DB.Prepare(preUpdateStr)
	if err != nil {
		common.Logger.Error("dao UpdateBalance failed:", err)
		return false
	}
	_, err = stmt.Exec(balance, updateTime, id)
	if err != nil {
		common.Logger.Error("dao UpdateBalance failed:", err)
		return false
	}
	return true
}

// 更新订单表数据
func UpdateProductInOrder(updateStr string) {
	_, err := DB.Exec(updateStr)
	if err != nil {
		common.Logger.Error("exec failed:", err, ", sql:", updateStr)
		return
	}
}

// 查询充值卡合法性
func QueryRechargeCard(id string) bool {
	queryStr := fmt.Sprintf("SELECT COUNT(*) FROM recharge_cards AS r WHERE r.id=%s", id)
	rows, e := DB.Query(queryStr)
	defer rows.Close()
	if e != nil {
		common.Logger.Error("query recharge_cards error")
		return false
	}
	count := 0
	for rows.Next() {
		rows.Scan(&count)
	}

	return count == 1
}

// 检查用户存在性
func QueryUserExists(name string) bool {
	queryStr := fmt.Sprintf("SELECT COUNT(*) FROM user WHERE user.username=\"%s\"", name)
	rows, e := DB.Query(queryStr)
	defer rows.Close()
	if e != nil {
		common.Logger.Error("query user error")
		return false
	}
	count := 0
	for rows.Next() {
		rows.Scan(&count)
	}

	return count == 1
}

// 使用充值卡，更新用户余额
func UserRechargeCard(cardId string, username string) bool {
	var balance, credits float64

	// 查询充值卡点数
	queryStr := fmt.Sprintf("SELECT credits FROM recharge_cards AS r WHERE r.id=\"%s\"", cardId)
	row := DB.QueryRow(queryStr)
	err := row.Scan(&credits)
	if err != nil {
		common.Logger.Error("query recharge_card credits error: ", err)
	}

	// 更新用户余额
	queryStr = fmt.Sprintf("SELECT balance FROM user WHERE user.username=\"%s\"", username)
	rowUser := DB.QueryRow(queryStr)
	err = rowUser.Scan(&balance)
	if err != nil {
		common.Logger.Error("query user balance error: ", err)
	}
	balance += credits
	stmt, err := DB.Prepare("UPDATE user SET balance=? WHERE user.username=?")
	if err != nil {
		common.Logger.Error("dao update user balance failed:", err)
		return false
	}
	_, err = stmt.Exec(balance, username)
	if err != nil {
		common.Logger.Error("dao update user balance failed:", err)
		return false
	}

	// 充值完成后，删除充值卡记录
	stmt, err = DB.Prepare("DELETE FROM recharge_cards AS r WHERE r.id=?")
	if err != nil {
		common.Logger.Error("dao delete recharge_card balance failed:", err)
		return false
	}
	_, err = stmt.Exec(cardId)
	if err != nil {
		common.Logger.Error("dao delete recharge_card balance failed:", err)
		return false
	}

	return true
}