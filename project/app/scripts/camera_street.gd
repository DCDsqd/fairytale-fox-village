extends Camera2D


onready var hero = get_parent().get_node("ob_hero")

func _process(delta) -> void:
	if Input.is_action_just_released("ui_home") and (hero.state == 'menu' or hero.state == 'game'):
		get_node("ob_journal").turner()
	position = position.move_toward(hero.position, 10*delta*position.distance_to(hero.position))
