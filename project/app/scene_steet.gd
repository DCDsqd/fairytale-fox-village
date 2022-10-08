extends Node2D

var db_script
onready var db = get_parent().get_db()
onready var game = get_parent().get_game()
onready var player = get_parent().get_player()

func _ready():
	#db_script = get_parent().get_db()
	#game = get_parent().get_game()
	#player = get_parent().get_player()
	pass

func get_game() -> Game:
	return game

func get_player() -> Player:
	return player

func get_db() -> Script:
	return db_script
