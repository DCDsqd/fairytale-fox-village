extends Node2D

onready var hero = get_parent().get_node("ob_hero")
onready var game_data : GameData
onready var game : Game
onready var player : Player
var id =3
onready var _main : Fox = Fox.new();

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			game_data = get_parent().get_db().get_data()
			game = get_parent().get_game()
			player = get_parent().get_player()
			_main.variator(id, position, game_data, game, player, hero)
