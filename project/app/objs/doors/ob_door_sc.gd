extends AnimatedSprite

onready var hero = get_parent().get_node("ob_hero")

func _ready() -> void:
	z_index = position.y/5

func _process(delta):
	if position.distance_to(hero.position) < 20:
		frame = 2
	else:
		frame = 1
