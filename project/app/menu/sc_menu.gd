extends Node2D


func start():
	get_tree().change_scene("res://scene_change.tscn")
	
func exit():
	get_tree().quit()
