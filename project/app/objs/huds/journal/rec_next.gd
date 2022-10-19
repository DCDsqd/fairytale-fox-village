extends TextureButton

onready var par = get_parent().get_parent().get_parent();

func _ready():
	connect("pressed", par, "_r_next")
