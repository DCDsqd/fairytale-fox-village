extends Node2D

func _ready():
	#Game object
	var game := Game.new()
	
	#Test stuff
	print(game.test_godot_output())
	print("Starting time: ", str(game.current_time()) + ":00", ", starting day: ", str(game.current_day()))
	_setup_time_control(game)
	
	#Player object
	var player := Player.new()
	
	#Initialize game and player objects only after both of them are created
	#since they rely on each other
	player.init(game)
	game.init(player)

#Starts the timer for updating game time during the game
func _setup_time_control(game:Game) -> void:
	# Timer node
	var timer := Timer.new()

	# Set timer interval in seconds
	var HOUR_REAL_TIME := 0.5
	timer.set_wait_time(HOUR_REAL_TIME)

	# Set it as repeat
	timer.set_one_shot(false)

	# Connect timer to add_hour function
	timer.connect("timeout", self, "add_hour", [game])

	# Add to the tree as child of the current node
	add_child(timer)
	
	#Start the timer
	timer.start()

#Adds an hour to C++ game class time property and prints updated time
func add_hour(game:Game) -> void:
	game.add_hour()
	print("Time has been updated! New time: ", str(game.current_time()) + ":00", ", day: ", str(game.current_day()))
