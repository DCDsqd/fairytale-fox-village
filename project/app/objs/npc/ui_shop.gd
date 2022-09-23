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

var sel_item : Array;
var sel = 0

func turner(vis) -> void:
	hero = get_parent().get_parent().get_node("ob_hero")
	game_data = get_parent().get_parent().get_parent().get_db().get_data()
	ingr_1 = get_node("TextureRect/HBoxContainer/text_1")
	ingr_2 = get_node("TextureRect/HBoxContainer/text_2")
	txt_1 = get_node("TextureRect/HBoxContainer/text_1/lb_name")
	txt_2 = get_node("TextureRect/HBoxContainer/text_2/lb_name")
	over_1 = get_node("TextureRect/HBoxContainer/text_1/lb_over")
	over_2 = get_node("TextureRect/HBoxContainer/text_2/lb_over")
	
	for i in range(0, 20):
		if game_data.get_ingredient(sel).is_available() == 1:
			sel_item.append(game_data.get_ingredient(sel))
	
	if vis == true:
		hero.state = 'ui'
		visible = vis
		upd()
	else:
		hero.state = 'game'
		visible = vis

func upd() -> void:
	ingr_1.texture_normal.current_frame = sel_item[sel].get_id()
	ingr_2.texture_normal.current_frame =  sel_item[sel+1].get_id()
	txt_1.text =  sel_item[sel].get_name()
	txt_2.text =  sel_item[sel+1].get_name()
	over_1.text = String( sel_item[sel].get_const())
	over_2.text = String( sel_item[sel+1].get_const())

func buy_1() -> void:
	pass

func buy_2() -> void:
	pass

func next() -> void:
	sel+=1
	upd()

func prev() -> void:
	pass
