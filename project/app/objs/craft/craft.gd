extends HBoxContainer

onready var hero
onready var game : Game
onready var player : Player
onready var game_data : GameData
onready var ingr_1 : TextureRect
onready var ingr_2 : TextureRect
onready var res : TextureButton

var sel = 0;
var craft_food : Array = [];
var wrkplc

func _ready() -> void:
	pass

func turner(vis) -> void:
	hero = get_parent().get_parent().get_node("ob_hero")
	if vis == true:
		hero.state = 'ui'
		#hero.anim()
		visible = vis
		work()
	else:
		hero.state = 'game'
		visible = vis

func work():
	sel = 0
	ingr_1 = get_node("ingt_1")
	ingr_2 = get_node("ingt_2")
	res = get_node("made")
	game = get_parent().get_parent().get_game()
	player = get_parent().get_parent().get_player()
	game_data = get_parent().get_parent().get_db().get_data()
	

	var av_food : Array = [];
	av_food = player.inv_get_available_food(game_data)
	
	for i in av_food:
		if i.get_type() == wrkplc.type:
			craft_food.push_back(i)
			var cur_ingr = i.get_ingridients()
			print(i.get_name(), ": " + cur_ingr[0].get_name(), " " + cur_ingr[1].get_name())
	
	print('size ', craft_food.size())
	
	if craft_food.size() == 0:
		print('i can\'t')
		turner(false)
	else:
		set_food()
		print(av_food.size())

func set_food():
	#print(craft_food[sel].get_ingridients()[0].get_id() - 1)
	#print(craft_food[sel].get_ingridients()[1].get_id() - 1)
	ingr_1.texture.current_frame = craft_food[sel].get_ingridients()[0].get_id() - 1
	ingr_2.texture.current_frame = craft_food[sel].get_ingridients()[1].get_id() - 1
	res.texture_normal.current_frame = craft_food[sel].get_id() - 1
	return

func set_wrk(plc):
	wrkplc = plc

func next():
	if craft_food.size()-1 == sel:
		sel = 0
	else:
		sel+=1
	set_food()

func prev():
	if sel == 0:
		sel = craft_food.size()-1
	else:
		sel-=1
	set_food()

func close():
	turner(false)
	wrkplc.close()

func made():
	var av_food : Array = [];
	av_food = player.inv_get_available_food(game_data)
	player.inv_add_ingredients(craft_food[sel].get_ingridients()[0],-1)
	player.inv_add_ingredients(craft_food[sel].get_ingridients()[1],-1)
	turner(false)
	wrkplc.coock(craft_food[sel], player)
	craft_food.clear()
