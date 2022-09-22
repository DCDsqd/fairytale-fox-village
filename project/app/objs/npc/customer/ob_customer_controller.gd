extends Node2D


var customer : Array
var cd : float

func _ready():
	cd = 10

func _process(delta):
	cd -= delta*0.5
	if cd <= 0:
		var node = load("res://objs/npc/customer/ob_customer.tscn")
		var node_inst = node.instance()
		node_inst.set_name('ob_customer')
		get_parent().add_child(node_inst)
		node_inst.position = position
		customer.append(node_inst)
		node_inst.control = self
		print('poss')
		cd = 100

func cheacker():
	for i in range(0, customer.size()):
		customer[i].check()

func erase(id : Node2D):
	customer.erase(id)
	id.queue_free()
