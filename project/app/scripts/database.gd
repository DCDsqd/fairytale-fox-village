# SQLite database functions & variables

var game_data # Object that is supposed to contain all the needed info from db
# !!! @game_data variable is not valid until init_game_data_obj() is called

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db # Actual database object, not valid until setup_db() is called
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

func init_game_data_obj() -> void:
	game_data = GameData.new()

func load_all_data() -> void:
	load_civilians()
	load_ingridients()
	
func load_civilians() -> void:
	var table_name = "CIVILIANS"
	var err = db.query("SELECT id, name, catch_phrase FROM " + table_name + ";")
	if !err:
		print("ERROR in database.gd::load_civilians(): ", err, db.error_message)
	for i in range(0, db.query_result.size()):
		# print("i = ", i)
		var civ = Civilian.new()
		civ.bind_values(db.query_result[i]["id"], db.query_result[i]["name"], db.query_result[i]["catch_phrase"])
		game_data.add_civilian(civ)
		# game_data.add_civilian(db.query_result[i]["id"], db.query_result[i]["name"], db.query_result[i]["catch_phrase"])
		# print("Total civilians: ", game_data.total_civilians())
		# var civ = game_data.get_civilian(i)
		# var _civ = game_data.get_civilian(i)
		# print(civ.get_name(), " : ", _civ.get_name())

func load_ingridients() -> void:
	var table_name = "INGRIDIENTS"
	var err = db.query("SELECT id, name, type_id, is_default, cost FROM " + table_name + ";")
	if !err:
		print("ERROR in database.gd::load_ingridients(): ", err, db.error_message)
	for i in range(0, db.query_result.size()):
		# print("i = ", i)
		var ingr = Ingridient.new()
		ingr.bind_values(db.query_result[i]["id"], db.query_result[i]["name"], db.query_result[i]["type_id"], db.query_result[i]["is_default"], db.query_result[i]["cost"])
		game_data.add_ingridient(ingr)
		# var df = game_data.get_ingridient(i)
		# print(df.get_name())
