extends TextureButton

onready var par = get_parent();

func _ready():
	connect("pressed", par, "made")