extends Button


var task_id;
var task_name;
var task_descr;
var task_status;
var descr : Label;


onready var par = get_parent().get_parent().get_parent().get_parent();

func set_task(i : int, data : GameData, _descr : Label):
	var task : Quest = data.get_quest(i)
	task_id = i;
	task_name = task.get_name();
	task_descr = task.get_descr();
	task_status = task.get_status();
	self.theme = preload("res://materials/journal_btn.tres")
	descr = _descr;
	text = "Gotta start \nsomewhere, right?";


func _pressed():
	descr.text = task_descr;
