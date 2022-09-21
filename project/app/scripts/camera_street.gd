extends Camera2D


onready var hero = get_parent().get_node("ob_hero")

func _process(delta) -> void:
	position = position.move_toward(hero.position, 10*delta*position.distance_to(hero.position))
