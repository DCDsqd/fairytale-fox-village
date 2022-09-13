extends Node2D

func _ready():
	var example := Example.new()
	print(example.greatings_func())
