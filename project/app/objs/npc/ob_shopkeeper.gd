extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hero = get_parent().get_node("ob_hero")
onready var craft_ui : Control = get_parent().get_node("camera_street/Control");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = position.y/5

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			craft_ui.turner(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
