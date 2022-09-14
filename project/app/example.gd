extends Node2D

func _ready():
	var game := Game.new()
	print(game.test_godot_output())
	print("Starting time: ", str(game.current_time()) + ":00", ", starting day: ", str(game.current_day()))
