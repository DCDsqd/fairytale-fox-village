# SQLite database functions & variables

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db # Actual database object, not valid unlill setup_db() is called
var db_path = "res://db/data.db" # Path do db

# Sets up the database connection and makes @db variable valid
func setup_db() -> void:
	print("database.gd::setup_db was called")
	db = SQLite.new()
	db.path = db_path
	
func open_db() -> void:
	var err = db.open_db()
	if !err:
		print("ERROR in database.gd::open_db(): ", err)
	
func close_db() -> void:
	var err = db.close_db()
	if !err:
		print("ERROR in database.gd::close_db(): ", err)

func test_select() -> int:
	var table_name = "TEST_TABLE"
	var err = db.query("SELECT * FROM " + table_name + ";")
	# print(err)
	if !err:
		print("ERROR in database.gd::test_select(): ", err, db.error_message)
	# for i in range(0, db.query_result.size()):
	# print(db.query_result.size())
	# print(db.query_result[0]["id"])
	return db.query_result[0]["id"]
