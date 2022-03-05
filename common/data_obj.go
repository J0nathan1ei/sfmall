package common

type Address struct{
	Id				int			`sql:"id"`
	UserId			string		`sql:"user_id"`
	Name			string		`sql:"name"`
	Mobile			string		`sql:"mobile"`
	PostalCode		int			`sql:"postal_code"`
	Province		string		`sql:"province"`
	City			string		`sql:"city"`
	District		string		`sql:"district"`
	DetailedAddress	string		`sql:"detailed_address"`
	IsDefault		int			`sql:"is_default"`
	Created			string		`sql:"created"`
	Updated			string		`sql:"updated"`
}


type Category struct{
	Id			int			`sql:"id"`
	Name		string		`sql:"name"`
	ParentId	int			`sql:"parent_id"`
	Level		int			`sql:"level"`
	Sort		int			`sql:"sort"`
	Created		string		`sql:"created"`
	Updated		string		`sql:"updated"`
}


type Order struct{
	Id				int			`sql:"id"`
	ProductItem		string		`sql:"product_item"`
	TotalPrice		float64		`sql:"total_price"`
	Status			string		`sql:"status"`
	AddressId		int			`sql:"address_id"`
	UserId			string		`sql:"user_id"`
	NickName		string		`sql:"nick_name"`
	Created			string		`sql:"created"`
	Updated			string		`sql:"updated"`
}


type Product struct{
	Id                  int			`sql:"id"`
	CategoryId          int			`sql:"category_id"`
	Title				string		`sql:"title"`
	Description			string		`sql:"description"`
	Price				float32		`sql:"price"`
	Amount				int			`sql:"amount"`
	Sales				int			`sql:"sales"`
	MainImage			string		`sql:"main_image"`
	Delivery			string		`sql:"delivery"`
	Assurance			string		`sql:"assurance"`
	Name				string		`sql:"name"`
	Weight				float64		`sql:"weight"`
	Brand				string		`sql:"brand"`
	Origin				string		`sql:"origin"`
	ShelfLife			string		`sql:"shelf_life"`
	NetWeight			float64		`sql:"net_weight"`
	UseWay				string		`sql:"use_way"`
	PackingWay			string		`sql:"packing_way"`
	StorageConditions	string		`sql:"storage_conditions"`
	DetailImage			string		`sql:"detail_image"`
	Status				int			`sql:"status"`
	Created				string		`sql:"created"`
	Updated				string		`sql:"updated"`
}


type User struct{
	Id				string		`sql:"id"`
	UserName 		string		`sql:"username"`
	RealName 		string		`sql:"real_name"`
	RoleId			int			`sql:"role_id"`
	Password 		string		`sql:"password"`
	Phone			string		`sql:"phone"`
	Balance			float64		`sql:"balance"`
	Status			int			`sql:"status"`
	Created			string		`sql:"created"`
	Updated			string		`sql:"updated"`
	LoggedInTime	string		`sql:"logged_in_time"`
}