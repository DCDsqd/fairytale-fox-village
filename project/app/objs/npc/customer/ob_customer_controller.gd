extends Node2D

var random : RandomNumberGenerator;
var customer : Array
var cd : float

func _ready():
	random = RandomNumberGenerator.new()
	cd = 1

func new_custommer():
	var sprs : Array = get_parent().get_parent().get_sprs()
	var node = load("res://objs/npc/customer/ob_customer.tscn")
	var node_inst = node.instance()
	var hero = get_parent().get_node("ob_hero")
	
	random.randomize()
	
	node_inst.get_node("sp_person").frames = sprs[random.randi_range(0, 6)]
	node_inst.set_name('ob_customer')
	get_parent().add_child(node_inst)
	var _x = 0;
	var full = true
	
	while full:
		_x+=4;
		if hero.position.distance_to(Vector2(position.x+_x, position.y)) > 64:
			print(hero.position.x, ' : ', position.x+_x);
			break;
	
	node_inst.position.x = position.x + _x
	node_inst.position.y = position.y
	
	customer.append(node_inst)
	node_inst.control = self

func cheacker():
	for i in range(0, customer.size()):
		customer[i].check()

func erase(id : Node2D):
	customer.erase(id)
	id.queue_free()
