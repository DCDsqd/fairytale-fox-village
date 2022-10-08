extends Node2D

onready var hero = get_parent().get_node("ob_hero")
onready var game_data : GameData = get_parent().get_game()
onready var game : Game = get_parent().get_player()
onready var player : Player
var id = 1
onready var _main : Fox = Fox.new();

func _ready() -> void:
	pass

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			_main.variator(id, position, game_data, game, player, hero)
