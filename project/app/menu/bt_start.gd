extends Button

onready var par = get_parent().get_parent().get_parent();

func _ready():
	connect("pressed", par, "start")
