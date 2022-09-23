extends Node2D

var db_script
var db # Database object that is going to be valid after setup_db() is called
var game # Main game object
var player # Main player object

func _ready():
	db_script = get_parent().get_db()
	game = get_parent().get_game()
	player = get_parent().get_player()

func get_game() -> Game:
	return game

func get_player() -> Player:
	return player

func get_db() -> Script:
	return db_script
