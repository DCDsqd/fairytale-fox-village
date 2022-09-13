extends Node2D

func _ready():
	var example := Example.new()
	var mdl := My_Module.new()
	print(example.greatings_func())
