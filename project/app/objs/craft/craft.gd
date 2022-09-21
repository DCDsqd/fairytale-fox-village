extends HBoxContainer


onready var game : Game
onready var bt_prev : Button
onready var bt_next : Button
onready var bt_made : Button
var wrkplc

func _redy() -> void:
	bt_prev = get_node("prev")
	bt_next = get_node("next")
	bt_next.connect("pressed", self, "prev")

func turner(vis) -> void:
	visible = vis

func set_wrk(plc):
	wrkplc = plc
	wrkplc.coock('sfasdfsadf')

func prev():
	print('prev')
