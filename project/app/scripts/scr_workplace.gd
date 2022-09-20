extends Node2D


class_name workspace

var timer: float = 0.0;
var cook: bool = false;

func inter(sp_comp, clr) -> String:
	if cook == false:
		sp_comp.modulate = clr
		cook = true
		timer = 20
		return 'start'
	else:
		if timer <= 0:
			cook = false
			timer = 0
			return 'compl'
		else:
			return 'process'

func timer(sp_timer, sp_comp, delta):
	if timer > 0:
		sp_timer.frame = (1-timer/20)*11
		timer -= delta
	sp_timer.visible = cook
	sp_comp.visible = cook
