extends Node2D

var centrifuge = Centrifuge.new()
var timer = 0.0;
var cook = false;


onready var hero = get_parent().get_node("ob_hero")
onready var sp_comp = get_node("sp_work/sp_comp")
onready var sp_timer = get_node("sp_work/sp_comp/sp_timer")

func _ready() -> void:
	pass



func _process(delta):
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 30:
			if cook == false:
				cook = true
				timer = 20
			else:
				if timer <= 0:
					cook = false
					timer = 0
					print('compl')
				else:
					print('process' + str(timer))
	
	if timer > 0:
		sp_timer.frame = (1-timer/20)*11
		timer -= delta
	
	sp_comp.visible = cook
	sp_timer.visible = cook
	
	pass
