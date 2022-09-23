extends Node2D

onready var hero = get_parent().get_node("ob_hero")
onready var game_data : GameData
onready var game : Game
onready var player : Player
var id = 7

func _process(delta) -> void:
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			game_data = get_parent().get_db().get_data()
			game = get_parent().get_db().get_game()
			player = get_parent().get_db().get_player()
			var civ : Civilian = game_data.get_civilian(id - 1)
			var quest_in_progress : Quest = game_data.get_active_quest_for_civ(civ)
			var quest_avail : Quest = game_data.get_avail_quest_for_civ(civ, game.current_day())
			var dialog_main : Dialog
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
			#TO DO: Make output on scene of @dialog_main obj
			# Here:
