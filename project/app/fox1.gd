extends Node2D

onready var hero = get_parent().get_node("ob_hero")
onready var game_data : GameData

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			game_data = get_parent().get_db().get_data()
