extends Node2D

var db_script = load("res://scripts/database.gd").new()
var db # Database object that is going to be valid after setup_db() is called
var game # Main game object
var player # Main player object

func _ready():
	# Setub db connection
	setup_db()
	db_script.open_db()
	print(db_script.test_select())
	
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

# Starts the timer for updating game time during the game
func _setup_time_control() -> void:
	# Timer node
	var timer := Timer.new()

	# Set timer interval in seconds
	var HOUR_REAL_TIME := 0.5
	timer.set_wait_time(HOUR_REAL_TIME)

	# Set it as repeat
	timer.set_one_shot(false)

	# Connect timer to add_hour function
	var error_code = timer.connect("timeout", self, "add_hour")
	if error_code != 0:
		print("ERROR: ", error_code)

	# Add to the tree as child of the current node
	add_child(timer)
	
	# Start the timer
	timer.start()

# Adds an hour to C++ game class time property and prints updated time
func add_hour() -> void:
	game.add_hour()
	print("Time has been updated! New time: ", str(game.current_time()) + ":00", ", day: ", str(game.current_day()))

# Sets up SQLite database connection and @db variable
func setup_db() -> void:
	db_script.setup_db()
	db = db_script.db