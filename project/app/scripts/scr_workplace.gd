extends Node2D


class_name workspace

var timer: float = 0.0;
var state = 'noth';
var type;
var food : Food
var player : Player

func set_type(_type):
	type = _type

func inter(sp_comp, clr, craft_ui : HBoxContainer) -> String:
	if state == 'noth':
		sp_comp.modulate = clr
		state = 'wait'
		craft_ui.set_wrk(self)
		craft_ui.turner(true)
		timer = 20
		return 'start'
	elif state == 'coock':
		if timer <= 0:
			state = 'noth'
			timer = 0
			player.inv_add_food(food, 1)
			return 'compl'
		else:
			return 'process'
	return 'noth'

func timer(sp_timer, sp_comp, delta):
	if timer > 0:
		sp_timer.frame = (1-timer/20)*11
		timer -= delta
	if state == 'coock':
		sp_timer.visible = true
		sp_comp.visible = true
	else:
		sp_timer.visible = false
		sp_comp.visible = false

func coock(i : Food, _player):
	state = "coock"
	food = i
	player = _player
