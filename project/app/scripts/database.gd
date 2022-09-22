# SQLite database functions & variables

var game_data # Object that is supposed to contain all the needed info from db
# !!! @game_data variable is not valid until init_game_data_obj() is called

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db : SQLite # Actual database object, not valid until setup_db() is called
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
	
func create_2d_array(w, h):
	var map = []

	for x in range(w):
		var col = []
		col.resize(h)
		map.append(col)

	return map

func init_game_data_obj() -> void:
	game_data = GameData.new()

func load_all_data() -> void:
	load_civilians()
	load_ingredients()
	load_food()
	load_dialogs()
	load_quests()
	
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

func load_ingredients() -> void:
	var table_name = "INGREDIENTS"
	var err = db.query("SELECT id, name, type_id, is_default, cost FROM " + table_name + ";")
	if !err:
		print("ERROR in database.gd::load_ingredients(): ", err, db.error_message)
	for i in range(0, db.query_result.size()):
		# print("i = ", i)
		var ingr = Ingredient.new()
		ingr.bind_values(db.query_result[i]["id"], db.query_result[i]["name"], db.query_result[i]["type_id"], db.query_result[i]["is_default"], db.query_result[i]["cost"])
		game_data.add_ingredient(ingr)
		# var df = game_data.get_ingredient(i)
		# print(df.get_name())

func load_food() -> void:
	var table_name = "FOOD"
	var err = db.query("SELECT id, name, type, cost FROM " + table_name + ";")
	if !err:
		print("ERROR in database.gd::load_food(): ", err, db.error_message)
		
	var n = db.query_result.size()
	var query_matrix = create_2d_array(n, 4)

	for i in range(0, n):
		# print(i)
		query_matrix[i][0] = db.query_result[i]["id"]
		query_matrix[i][1] = db.query_result[i]["name"]
		query_matrix[i][2] = db.query_result[i]["type"]
		query_matrix[i][3] = db.query_result[i]["cost"]
		
		# var act_ingr : Array = game_data.get_food(0).get_ingredients()
		# print(act_ingr[0].get_name())
		
	for i in range(0, n):
		var ingr_reqs_ids : Array = select_food_reqs(query_matrix[i][0])
		var ingr_reqs : Array = game_data.get_ingredient_mult(ingr_reqs_ids)
		var food = Food.new()
		food.bind_values(query_matrix[i][0], query_matrix[i][1], ingr_reqs, query_matrix[i][2], query_matrix[i][3])
		game_data.add_food(food)
		
func select_food_reqs(food_id : int) -> Array:
	var req_arr : Array = []
	var table_name = "FOOD_REQS"
	var err = db.query("SELECT ingr_id FROM " + table_name + " WHERE food_id = " + str(food_id) + ";")
	if !err:
		print("ERROR in database.gd::select_food_reqs(): ", err, db.error_message)
	for i in range(0, db.query_result.size()):
		req_arr.append(db.query_result[i]["ingr_id"])
	return req_arr
	
func load_dialogs() -> void:
	var table_name = "DIALOGS"
	var diag_idx_arr : Array = []
	var err = db.query("SELECT id FROM " + table_name + ";")
	if !err:
		print("ERROR in database.gd::load_dialogs(): ", err, db.error_message)
	for i in range(0, db.query_result.size()):
		diag_idx_arr.append(db.query_result[i]["id"])
	for i in range(0, diag_idx_arr.size()):
		var select_matrix : Array = select_dialog(diag_idx_arr[i])
		var new_dialog = Dialog.new()
		new_dialog.set_dialog_id(diag_idx_arr[i])
		for j in range(0, select_matrix.size()):
			var speaker_id = select_matrix[j][0]
			var text = select_matrix[j][1]
			var index = select_matrix[j][2]
			var speaker_ptr : Civilian = game_data.get_civilian(speaker_id)
			new_dialog.add_phrase_to_conv(speaker_ptr, text, index)
			game_data.add_dialog(new_dialog)
		
func select_dialog(diag_id : int) -> Array:
	var table_name = "DIALOG_TEXTS"
	var err = db.query("SELECT dialog_id, speaker, text, _index FROM " + table_name + " WHERE dialog_id = " + str(diag_id) + ";")
	if !err:
		print("ERROR in database.gd::select_dialog(): ", err, db.error_message)
	var matrix : Array = create_2d_array(db.query_result.size(), 3)
	for i in range(0, db.query_result.size()):
		matrix[i][0] = db.query_result[i]["speaker"]
		matrix[i][1] = db.query_result[i]["text"]
		matrix[i][2] = db.query_result[i]["_index"]
	return matrix
	
func load_quests() -> void:
	var table_name = "QUESTS"
	var err = db.query("SELECT id, name, descr, asker_id, receiver_id, start_dialog_id, end_dialog_id FROM " + table_name + ";")
	if !err:
		print("ERROR in database.gd::load_quests(): ", err, db.error_message)
	var matrix : Array = create_2d_array(db.query_result.size(), 7)
	for i in range(0, db.query_result.size()):
		matrix[i][0] = db.query_result[i]["id"]
		matrix[i][1] = db.query_result[i]["name"]
		matrix[i][2] = db.query_result[i]["descr"]
		matrix[i][3] = db.query_result[i]["asker_id"]
		matrix[i][4] = db.query_result[i]["receiver_id"]
		matrix[i][5] = db.query_result[i]["start_dialog_id"]
		matrix[i][6] = db.query_result[i]["end_dialog_id"]
		
	for i in range(0, matrix.size()):
		var id = matrix[i][0]
		var name = matrix[i][1]
		var descr = matrix[i][2]
		var asker_id = matrix[i][3]
		var receiver_id = matrix[i][4]
		var start_dialog_id = matrix[i][5]
		var end_dialog_id = matrix[i][6]
		
		# Get pointer to objects by id
		var asker = game_data.get_civilian(asker_id)
		var receiver = game_data.get_civilian(receiver_id)
		var start_dialog = game_data.get_dialog(start_dialog_id)
		var end_dialog = game_data.get_dialog(end_dialog_id)
		
		var targ_arr : Array = select_quest_targets(id)
		var targ_arr_ptrs : Array = []
		for j in range(0, targ_arr.size()):
			targ_arr_ptrs.append(game_data.get_food(targ_arr[j]))
		
		var new_quest = Quest.new()
		new_quest.bind_values(id, name, descr, asker, receiver, start_dialog, end_dialog)
		new_quest.add_food_targets(targ_arr_ptrs)

func select_quest_targets(quest_id : int) -> Array:
	var arr : Array
	var table_name = "QUESTS_TARGETS"
	var err = db.query("SELECT food_id FROM " + table_name + " WHERE quest_id =" + str(quest_id) + ";")
	if !err:
		print("ERROR in database.gd::select_quest_targets(): ", err, db.error_message)
	for i in range(0, db.query_result.size()):
		arr.append(db.query_result[i]["food_id"])
	return arr


func get_data() -> GameData:
	return game_data
