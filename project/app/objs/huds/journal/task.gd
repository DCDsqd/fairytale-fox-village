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
	descr = _descr;
	if (task_status == 1):
		self.theme = preload("res://materials/journal_btn.tres")
	else:
		self.theme = preload("res://materials/compl_btn.tres")
		task_descr += "\n(complete)"
	text = task_name


func _pressed():
	descr.text = task_descr;
