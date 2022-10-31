extends Node2D

onready var hero = get_parent().get_node("ob_hero")
onready var game_data : GameData = get_parent().get_data()
onready var game : Game = get_parent().get_game()
onready var player : Player = get_parent().get_player()
var id = 5
onready var _main : Fox = Fox.new();

func _ready() -> void:
	z_index = position.y/5
	get_node("sp_emot").visible = _main.get_quest(id, game_data, game.current_day())
	pass

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			_main.variator(id, position, game_data, game, player, hero)
			get_node("sp_emot").visible = _main.get_quest(id, game_data, game.current_day())
