extends Control

onready var hero
onready var game : Game
onready var player : Player
onready var game_data : GameData
onready var ingr_1 : TextureButton
onready var ingr_2 : TextureButton
onready var txt_2 : Label
onready var txt_1 : Label
onready var over_1 : Label
onready var over_2 : Label
onready var descr_1 : Label
onready var descr_2 : Label

var sel_item : Array;
var sel = 0

func turner(vis) -> void:
	sel = 0
	hero = get_parent().get_parent().get_node("ob_hero")
	game_data = get_parent().get_parent().get_parent().get_db().get_data()
	game = get_parent().get_parent().get_parent().get_game()
	player = get_parent().get_parent().get_parent().get_player()
	ingr_1 = get_node("TextureRect/HBoxContainer/text_1")
	ingr_2 = get_node("TextureRect/HBoxContainer/text_2")
	txt_1 = get_node("TextureRect/HBoxContainer/text_1/lb_name")
	txt_2 = get_node("TextureRect/HBoxContainer/text_2/lb_name")
	over_1 = get_node("TextureRect/HBoxContainer/text_1/lb_over")
	over_2 = get_node("TextureRect/HBoxContainer/text_2/lb_over")
	descr_1 = get_node("TextureRect/HBoxContainer/text_1/lb_descr")
	descr_2 = get_node("TextureRect/HBoxContainer/text_2/lb_descr")
	
	
	for i in range(0, 20):
		if game_data.get_ingredient(i).is_available() == 1:
			print(game_data.get_ingredient(i).get_name())
			sel_item.append(game_data.get_ingredient(i))
	
	if vis == true:
		hero.state = 'ui'
		visible = vis
		upd()
	else:
		hero.state = 'game'
		visible = vis

func upd() -> void:
	ingr_1.texture_normal.current_frame = sel_item[sel].get_id()-1
	txt_1.text =  sel_item[sel].get_name()
	over_1.text = String( sel_item[sel].get_const())
	descr_1.text = String( game_data.get_ingr_shop_info(sel_item[sel], player))

	ingr_2.texture_normal.current_frame =  sel_item[sel+1].get_id()-1
	txt_2.text =  sel_item[sel+1].get_name()
	over_2.text = String( sel_item[sel+1].get_const())
	descr_2.text = String( game_data.get_ingr_shop_info(sel_item[sel], player))

func buy_1() -> void:
	if game.get_gold() >= sel_item[sel].get_const():
		player.inv_add_ingredients(sel_item[sel], 1)
		game.add_gold(-sel_item[sel].get_const())
		print(player.inv_get_ingredients_cnt(sel_item[sel]))
	pass

func buy_2() -> void:
	if game.get_gold() >= sel_item[sel+1].get_const():
		player.inv_add_ingredients(sel_item[sel+1], 1)
		game.add_gold(-sel_item[sel+1].get_const())
		print(player.inv_get_ingredients_cnt(sel_item[sel+1]))
	pass

func next() -> void:
	if sel >= sel_item.size() - 2:
		sel = 0
	sel += 2
	upd()

func prev() -> void:
	if sel == 0:
		sel = sel_item.size() - 2
	sel -= 2
	upd()

func close() -> void:
	turner(false)
