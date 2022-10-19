extends KinematicBody2D


var sel : Food;
var cd : int;
var state: String;

onready var hero : Node2D
onready var control : Node2D
onready var game : Game
onready var player : Player
onready var game_data : GameData
onready var funt : Node2D = get_parent().get_node("ob_funt")

func _ready()  -> void:
	state = "see"
	hero = get_parent().get_node("ob_hero")
	game = get_parent().get_game()
	player = get_parent().get_player()
	game_data = get_parent().get_db().get_data()
	cd = 100;
	#print("asdfasdfsadf")

func check():
	if player.inv_get_food_cnt(sel) < 0:
		sel = null
		get_node("sp_emot").visible = false
		state = 'see'

func food_sel():
	var foods = player.inv_get_available_food(game_data)
	if foods.size() > 0:
		sel = game_data.get_food(foods[0])
		state = "selected"
	if sel == null:
		state = "see"
	else:
		print('select')
		get_node("sp_emot").visible = true
		

func sel():
	if Input.is_action_just_released("inter"):
		if position.distance_to(hero.position) < 50:
			game.add_gold(sel.get_cost())
			player.inv_add_food(sel,-1)
			control.cheacker()
			get_node("sp_emot").visible = false
			state = 'selled'
			print('seller')

func move(delta):
	if position.distance_to(hero.position) > 50:
		move_and_slide( (funt.position - position))

func move_out(delta):
	if position.distance_to(control.position) > 10:
		move_and_slide((control.position - position))
	else:
		control.erase(self)

func _process(delta) -> void:
	z_index = position.y/5
	if state == 'see':
		cd -= delta;
		move(delta);
		if cd <= 0:
			cd = 100
			food_sel()
	elif state == "selected":
		sel()
		move(delta);
	else:
		move_out(delta)
	
