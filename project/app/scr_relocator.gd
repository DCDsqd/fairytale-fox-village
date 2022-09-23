extends Node2D

onready var hero = get_parent().get_node("ob_hero")

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			get_parent().get_parent().change("res://Node2D.tscn")
