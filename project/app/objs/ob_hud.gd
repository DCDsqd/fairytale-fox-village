extends GridContainer


onready var time = get_node("col_2/spr/clock")
onready var money = get_node("col_2/spr/money")
onready var game : Game

func _process(delta) -> void:
	if game != null:
		time.text = str(game.current_time(),'\n00')
	else:
		game = get_parent().get_parent().get_game()
