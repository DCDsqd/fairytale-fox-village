extends Node2D

onready var spr : AnimatedSprite = get_node("spr")
onready var lbl : Label = get_node("Label")
onready var timer : Timer = get_parent().get_node("timer")
var day : int
var one_let : float
var perc : float


func _ready():
	day = get_parent().get_game().current_day();
	timer.set_paused(true)
	if (day == 1):
		lbl.text = "My store opens today \nI'm so glad we finally made it..."
		spr.animation = "start"
		spr.play()
	elif (day == 2):
		lbl.text = "first day in my shop so wonderful..."
		spr.animation = "day_1"
		spr.play()
	elif (day == 3):
		lbl.text = "I hope we get ready for Halloween..."
		spr.animation = "day_2"
		spr.play()
	else:
		var data : GameData = get_parent().get_data()
		if data.amount_of_failed_quests() == 0:
			lbl.text = "The atmosphere in the village is amazing, I'm so glad I was able to help everyone here..."
			spr.animation = "good"
		else:
			lbl.text = "Here comes Halloween. \nToo bad we couldn't help all the villagers. How tired I am..."
			spr.animation = "bad"
		spr.play()
	
	lbl.percent_visible = 0
	one_let = 1.0/float(lbl.text.length())
	print(one_let)


func _process(delta):
	perc += one_let*0.1
	lbl.percent_visible = perc
	if perc > 1.2:
		timer.set_paused(false)
		if day != 4:
			get_parent().change("res://Node2D.tscn")
		else:
			get_tree().change_scene("res://menu/sc_menu.tscn")
