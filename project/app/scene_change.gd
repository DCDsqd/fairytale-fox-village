extends Node

var db_script = load("res://scripts/database.gd").new()
var db # Database object that is going to be valid after setup_db() is called
var game # Main game object
var player # Main player object
var scene : Node2D
var game_data : GameData
var npc_spr : Array

func _ready():
	# Setub db connection
	setup_db()
	db_script.open_db()
	print(db_script.test_select())
	
	# Init game_data object
	db_script.init_game_data_obj()
	db_script.load_all_data()
	
	# Close db
	db_script.close_db()
	
	game_data = db_script.game_data
	
	# Game object
	game = Game.new()
	
	# Test stuff
	# print(game.test_godot_output())
	print("Starting time: ", str(game.current_time()) + ":00", ", starting day: ", str(game.current_day()))
	_setup_time_control()
	
	# Player object
	player = Player.new()
	
	# Initialize game and player objects only after both of them are created
	# since they rely on each other
	player.init(game)
	game.init(player)
	
	# Test
	var g = player.get_game()
	print(g.current_day())
	change("res://variator/sc_new_day.tscn")
	npc_loader()
	
	for i in range(1, 10):
		var cur_ingr_to_add = game_data.get_ingredient(i)
		player.inv_add_ingredients(cur_ingr_to_add, 1)

func npc_loader():
	npc_spr.append(load("res://sprite/npc/sp_rose.tres"))
	npc_spr.append(load("res://sprite/npc/sp_rose.tres"))
	npc_spr.append(load("res://sprite/npc/sp_luna.tres"))
	npc_spr.append(load("res://sprite/npc/sp_ozi.tres"))
	npc_spr.append(load("res://sprite/npc/sp_flareon.tres"))
	npc_spr.append(load("res://sprite/npc/sp_gideon.tres"))
	npc_spr.append(load("res://sprite/npc/sp_runi.tres"))

# Starts the timer for updating game time during the game
func _setup_time_control() -> void:
	# Timer node
	var timer := Timer.new()

	# Set timer interval in seconds
	var HOUR_REAL_TIME := 50
	timer.set_wait_time(HOUR_REAL_TIME)
	
	# Set it as repeat
	timer.set_one_shot(false)

	# Connect timer to add_hour function
	var error_code = timer.connect("timeout", self, "add_hour")
	if error_code != 0:
		print("ERROR: ", error_code)

	# Add to the tree as child of the current node
	timer.name = "timer"
	add_child(timer)
	
	# Start the timer
	timer.start()

# Adds an hour to C++ game class time property and prints updated time
func add_hour() -> void:
	var day_changed = game.add_hour()
	
	var creater = get_node("Node2D2/ob_customer_controller")
	if creater != null:
		creater.new_custommer()
	
	if day_changed == true:
		game_data.update_quests_status_on_day_switch(game.current_day())
		change("res://variator/sc_new_day.tscn")
	print("Time has been updated! New time: ", str(game.current_time()) + ":00", ", day: ", str(game.current_day()))

func change(res):
	if scene != null:
		scene.queue_free()
	var node = load(res)
	var node_inst = node.instance()
	add_child(node_inst)
	node_inst._ready()
	scene = node_inst

func get_sprs() -> Array:
	return npc_spr

# Sets up SQLite database connection and @db variable
func setup_db() -> void:
	db_script.setup_db()
	db = db_script.db

func get_game() -> Game:
	return game

func get_player() -> Player:
	return player

func get_db() -> Script:
	return db_script

func get_data() -> GameData:
	return game_data
