extends Camera2D

onready var hero = get_parent().get_node("ob_hero")

func mover(pos, delta):
	if pos == 0:
		position = position.move_toward(Vector2(400, 225), delta*500)
	else:
		position = position.move_toward(Vector2(400, 633), delta*500)

func _process(delta) -> void:
	if Input.is_action_just_released("ui_home") and (hero.state == 'menu' or hero.state == 'game'):
		get_node("ob_journal").turner()
	if hero.position.y < 400:
		mover(0, delta)
	else:
		mover(1, delta)
