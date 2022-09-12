extends Node2D

func _ready():
	var _game := Game.new()
	print(_game.test_godot_output())
