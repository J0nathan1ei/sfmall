package ao

type Category struct{
	Id			int			`sql:"id"`
	Name		string		`sql:"name"`
	ParentId	int			`sql:"parent_id"`
	Level		int			`sql:"level"`
	Sort		int			`sql:"sort"`
	Created		string		`sql:"created"`
	Updated		string		`sql:"updated"`
}