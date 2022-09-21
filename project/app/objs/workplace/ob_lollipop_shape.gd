extends Node2D

var timer = 0.0;
var cook = false;
var _main = workspace.new()

onready var hero = get_parent().get_node("ob_hero")
onready var sp_comp = get_node("sp_work/sp_comp")
onready var sp_timer = get_node("sp_work/sp_timer")

func _ready() -> void:
	z_index = position.y/5

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			var clr = Color(0.75, 0.55, 0.55)
			print(_main.inter(sp_comp, clr))
	_main.timer(sp_timer, sp_comp, delta)
	
	pass
