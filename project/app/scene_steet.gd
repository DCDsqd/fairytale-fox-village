extends Node2D

var db_script
onready var db = get_parent().get_db()
onready var game = get_parent().get_game()
onready var player = get_parent().get_player()
onready var game_data = get_parent().get_data()

func _ready():
	db_script = get_parent().get_db()
	game = get_parent().get_game()
	player = get_parent().get_player()
	game_data = get_parent().get_data();
	
	print("asdgjoiaoshsjdg ", game.current_day())
	pass

func get_game() -> Game:
	return game

func get_player() -> Player:
	return player

func get_db() -> Script:
	return db_script


func get_data() -> GameData:
	return game_data
