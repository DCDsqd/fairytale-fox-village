extends Node2D

onready var hero = get_parent().get_node("ob_hero")

func _ready():
	z_index = global_position.y/5

func _process(delta):
	if position.y - hero.position.y < 64 and hero.position.y - position.y < 0:
		modulate.a = 0.5
	else:
		modulate.a = 1
	pass
