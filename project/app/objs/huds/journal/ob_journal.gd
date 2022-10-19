extends Control

onready var hero
onready var game : Game
onready var player : Player
onready var game_data : GameData

func turner() -> void:
	hero = get_parent().get_parent().get_node("ob_hero")
	game_data = get_parent().get_parent().get_parent().get_db().get_data()
	game = get_parent().get_parent().get_parent().get_game()
	player = get_parent().get_parent().get_parent().get_player()
	ingr_col();
	food_col();
	quest_col();
	if visible == false:
		hero.state = 'menu'
		visible = true;
	else:
		hero.state = 'game'
		visible = false
	
func quest_col() -> void:
	
	var node = get_node("Pages/Quests/List")
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
	
	var lbl = get_node("Pages/Quests/Descr")
	var list : VBoxContainer = get_node("Pages/Quests/List")
	for i in range(0,9):
		if(game_data.get_quest(i).get_status() > 0):
			var btn = Button.new()
			btn.set_script(preload("res://objs/huds/journal/task.gd"))
			btn.set_task(i, game_data, lbl)
			list.add_child(btn)

func quest_sel(i : int) -> void:
	print(i)

func food_col() -> void:
	for i in range(1,19):
		var tmp;
		if( 1 <= i and i <= 8):
			tmp = String("Pages/Recepe/Pages/List_1/id_" + String(i) + "/txt/cnt")
		elif( 9 <= i and i <= 16):
			tmp = String("Pages/Recepe/Pages/List_2/id_" + String(i) + "/txt/cnt")
		else:
			tmp = String("Pages/Recepe/Pages/List_3/id_" + String(i) + "/txt/cnt")
		get_node(tmp).text = String("Count: " + String(player.inv_get_food_cnt(game_data.get_food(i-1))))

func food_swap(i : int) -> void:
	var pages : TabContainer = get_node("Pages/Recepe/Pages")
	if(i == 1):
		if(pages.current_tab < 2):
			pages.current_tab +=1
		else:
			pages.current_tab = 0
	else:
		if(pages.current_tab > 0):
			pages.current_tab -=1
		else:
			pages.current_tab = 2

func sel_guide(v) -> void:
	var img : TextureRect
	img = get_node("Pages/Guide/TextureRect")
	img.texture.current_frame = v

func sel_ingr(v) -> void:
	get_node("Pages/Ingredients/Pages").current_tab = v

func ingr_col()->void:
	for i in range(21):
		if(game_data.get_ingredient(i).is_available() == 1):
			var tmp
			if(i < 14):
				tmp = String("Pages/Ingredients/Pages/inv/id_" + String(i+1) + "/col")
			else:
				tmp = String("Pages/Ingredients/Pages/inv2/id_" + String(i+1) + "/col")
			#print(tmp)
			#print(game_data.get_ingredient(i).get_name())
			get_node(tmp).text = String(player.inv_get_ingredients_cnt(game_data.get_ingredient(i)));

#btns
func _g_move()->void:
	sel_guide(0)
func _g_craft()->void:
	sel_guide(1)
func _g_sel()->void:
	sel_guide(2)
func _g_quest()->void:
	sel_guide(3)

func _i_next()->void:
	sel_ingr(1)
func _i_prev()->void:
	sel_ingr(0)

func _r_next()->void:
	food_swap(1)
func _r_prev()->void:
	food_swap(1)
