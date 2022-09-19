extends Node2D

var speed = 100
var _x = 0
var _y = 0
var anim = 'f_idle'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func animat() -> void:
	if (_x == 0 and _y == 0):
		if anim == 'f_run':
			anim = 'f_idle'
		elif anim == 'b_run':
			anim = 'b_idle'
		elif anim == 'r_run':
			anim = 'r_idle'
		elif anim == 'l_run':
			anim = 'l_idle'
	if _y > 0:
		anim = 'f_run'
	elif _y < 0:
		anim = 'b_run'
	elif _x > 0:
		anim = 'r_run'
	elif _x < 0:
		anim = 'l_run'

func _process(delta) -> void:
	animat()
	_x = int(Input.is_action_pressed("mv_right")) - int(Input.is_action_pressed("mv_left"))
	_y = int(Input.is_action_pressed("mv_down")) - int(Input.is_action_pressed("mv_top"))
	get_node('spr').play(anim)
	if (true):
		position = position.move_toward(Vector2(position.x+_x,position.y+_y), delta * speed)
