extends Node

class_name Fox

onready var hero
onready var game_data : GameData
onready var game : Game
onready var player : Player
onready var dialog_main : Dialog
var iter
var fiter

var state = 'wait'

func get_quest(id, game_data, day) -> bool:
	var civ : Civilian = game_data.get_civilian(id - 1)
	var quest : Quest = game_data.get_avail_quest_for_civ(civ, day)
	
	if quest == null:
		return false
	
	if quest.get_status() == 0:
		return true
	
	return false

func variator(id, pos, game_data, game, player, hero):
	if state == 'wait':
		get_dialog(id, pos, game_data, game, player, hero)
	elif state == 'say':
		if iter >= dialog_main.conv_size() - 1:
			state = 'wait'
			hero.state = 'game'
			
			var dialog = hero.get_node("dialog") # reset
			set_dialog(dialog, '')
			
		else:
			say_dialog(id, pos, game_data, game, player, hero)


func set_dialog(dialog, text):
	if text == '':
		dialog.get_node("txt").text = "test" # reset
		dialog.get_node("sp_dialog_u").position.y = -21
		dialog.get_node("txt").rect_position.y = - 42
		dialog.visible = false
		return
	var heigh
	dialog.get_node("txt").text = text
	
	heigh = dialog.get_node("txt").get_line_count()*6 #AAA BLYAD'
	dialog.visible = true
	
	dialog.get_node("sp_dialog_c").scale.y = 0.111*(heigh-6)
	dialog.get_node("sp_dialog_u").position.y = 4 - (heigh-6)*3 + 3
	dialog.get_node("txt").rect_position.y = -12 - (heigh-6)*3 + 3
	#print(heigh)

func spliter(s: String, delimeters, allow_empty: bool = false) -> Array:
	var parts := []
	var start := 0
	var i := 0
	while i < s.length():
		if s[i] in delimeters:
			if allow_empty or start < i:
				parts.push_back(s.substr(start, i - start+1))
			start = i + 1
		i += 1
	if allow_empty or start < i:
		parts.push_back(s.substr(start, i - start))
	return parts


func say_dialog(id, pos, game_data, game, player, hero):
	if(fiter == -1):
		iter +=1
	
	var dialog = hero.get_node("dialog")
	var say : Array = dialog_main.get_conv_elem(iter)
	var says : Array = spliter(say[1], ['.', '!', '?'])
	var phraze : String;
	
	if(says.size() == 1):
		phraze = say[1]
	elif(says.size() > 1 and says.size()-1 > fiter):
		fiter+=1
		phraze = says[fiter]
	elif(says.size() > 1 and says.size()-1 == fiter):
		fiter = -1
		variator(id, pos, game_data, game, player, hero)
		return
	
	#var text : Label
	#text.rect_size
	set_dialog(dialog, '')
	set_dialog(dialog, phraze)
	
	
	if say[0] == null:
		dialog.global_position.y = hero.position.y-42.5
		dialog.global_position.x = hero.position.x-31.5
	else:
		dialog.global_position.y = pos.y-42.5
		dialog.global_position.x = pos.x-32.5


func get_dialog(id, pos, game_data, game, player, hero) -> void:
	var civ : Civilian = game_data.get_civilian(id - 1)
	var quest_in_progress : Quest = game_data.get_active_quest_for_civ(civ)
	var quest_avail : Quest = game_data.get_avail_quest_for_civ(civ, game.current_day())
	var extra_check : bool = false
	if quest_in_progress != null:
		# Check if could complete quest
		var reqs : Array = quest_in_progress.get_reqs()
		var satisf : bool = true
		for i in range(0, reqs.size()):
			if player.inv_get_food_cnt(reqs[i]) < 1:
				satisf = false
				break
		if satisf:
			dialog_main = quest_in_progress.get_end_dialog()
			var tmp : Array = quest_in_progress.get_targets()
			for i in tmp:
				player.inv_add_food(i, -1)
			quest_in_progress.set_completed()
		else:
			var catch_phrase : String = civ.get_catch_phrase()
			dialog_main = Dialog.new()
			dialog_main.add_phrase_to_conv(civ, catch_phrase, 1)
	elif quest_avail != null:
		dialog_main = quest_avail.get_start_dialog()
		quest_avail.set_in_prog()
		var st = quest_avail.get_status()
		print("st:" ,st)
	else:
		var catch_phrase : String = civ.get_catch_phrase()
		dialog_main = Dialog.new()
		dialog_main.add_phrase_to_conv(civ, catch_phrase, 1)
	state = 'say'
	hero.state = 'dialog'
	iter = -1
	fiter = -1
	say_dialog(id, pos, game_data, game, player, hero)
	#TO DO: Make output on scene of @dialog_main obj
	# Here:
