extends Node



class_name Fox

onready var hero
onready var game_data : GameData
onready var game : Game
onready var player : Player
var dialog_main : Dialog
var iter

var state = 'wait'

func variator(id, pos, game_data, game, player, hero):
	if state == 'wait':
		get_dialog(id, pos, game_data, game, player, hero)
	elif state == 'say':
		if iter >= dialog_main.conv_size() - 1:
			state = 'wait'
			hero.state = 'game'
			hero.get_node("sp_dialog_1").visible = false
		else:
			say_dialog(id, pos, game_data, game, player, hero)

func say_dialog(id, pos, game_data, game, player, hero):
	iter +=1
	hero.get_node("sp_dialog_1").visible = true
	var say = dialog_main.get_conv_elem(iter)
	if say[0] == null:
		hero.get_node("sp_dialog_1").global_position.y = hero.position.y-96
		hero.get_node("sp_dialog_1").global_position.x = hero.position.x
		hero.get_node("sp_dialog_1/txt").text = say[1]
	else:
		hero.get_node("sp_dialog_1").global_position.y = pos.y-96
		hero.get_node("sp_dialog_1").global_position.x = pos.x
		hero.get_node("sp_dialog_1/txt").text = say[1]


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
			quest_in_progress.set_completed()
		else:
			extra_check = true
	elif quest_avail != null:
		dialog_main = quest_avail.get_start_dialog()
		quest_avail.set_in_prog()
	elif extra_check:
		var catch_phrase : String = civ.get_catch_phrase()
		dialog_main = Dialog.new()
		dialog_main.add_phrase_to_conv(civ, catch_phrase, 1)
	else:
		var catch_phrase : String = civ.get_catch_phrase()
		dialog_main = Dialog.new()
		dialog_main.add_phrase_to_conv(civ, catch_phrase, 1)
	state = 'say'
	hero.state = 'ui'
	iter = -1
	say_dialog(id, pos, game_data, game, player, hero)
	#TO DO: Make output on scene of @dialog_main obj
	# Here:
