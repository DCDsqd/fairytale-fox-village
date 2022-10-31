extends Node2D

onready var spr : AnimatedSprite = get_node("spr")
onready var lbl : Label = get_node("Label")
onready var timer : Timer = get_parent().get_node("timer")
var day : int
var one_let : float
var perc : float


func _ready():
	var data : GameData = get_parent().get_data()
	day = get_parent().get_game().current_day();
	timer.set_paused(true)
	if (day == 1):
		lbl.text = "Today is the big day for me! \nThe store I was working on for months is set to open today! \nI'm so nervous but excited at the same time!\nLet's just hope it goes smoothly..."
		spr.animation = "start"
		spr.play()
	elif (day == 2):
		var q = data.amount_of_failed_quests()
		if q == 3:
			lbl.text = "Ok, first day didn't go exactly as I planned...\nI really hope that I can do better tommorow"
		elif q == 1:
			lbl.text = "Well, this day could've gone better but also a lot worse \nI'll try my hardest to step up even more tommorow!"
		else:
			lbl.text = "That was an ideal opening for my store! \nI really looking forward for tommorow!"
		spr.animation = "day_1"
		spr.play()
	elif (day == 3):
		lbl.text = "Uh, what a tough day! \nI just hope that I can help people prepare village for the Halloween..."
		spr.animation = "day_2"
		spr.play()
	else:
		if data.amount_of_failed_quests() == 0:
			lbl.text = "The atmosphere in the village is amazing! I'm so glad I was able to help everyone!"
			spr.animation = "good"
		else:
			lbl.text = "Here comes Halloween. \nToo bad my help wasn't enough to fully prepare for the celebration. \nLet's hope next year will be different."
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
