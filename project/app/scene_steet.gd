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
	
	pass

func get_game() -> Game:
	return get_parent().get_game()

func get_player() -> Player:
	return get_parent().get_player()

func get_db() -> Script:
	return get_parent().get_db()


func get_data() -> GameData:
	return get_parent().get_data();
