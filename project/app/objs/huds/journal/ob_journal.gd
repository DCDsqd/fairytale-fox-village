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
	if visible == false:
		hero.state = 'menu'
		visible = true;
	else:
		hero.state = 'game'
		visible = false
	
func quest_col() -> void:
	pass

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
			print(tmp)
			print(game_data.get_ingredient(i).get_name())
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
