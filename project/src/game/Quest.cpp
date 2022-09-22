#include "Quest.hpp"

void godot::Quest::bind_values(int _id, godot::String _name, godot::String _descr, Civilian* _asker, Civilian* _receiver, Dialog* _start_dialog, Dialog* _end_dialog)
{
	id = _id;
	name = _name;
	descr = _descr;
	asker = _asker;
	receiver = _receiver;
	start_dialog = _start_dialog;
	end_dialog = _end_dialog;
}

void godot::Quest::add_food_targets(godot::Array gd_targets)
{
	for (int i = 0; i < gd_targets.size(); ++i) {
		targets.push_back(static_cast<Food*>(gd_targets[i]));
	}
}

godot::Array godot::Quest::get_targets()
{
	godot::Array arr;
	for (int i = 0; i < targets.size(); ++i) {
		arr.push_back(targets[i]);
	}
	return arr;
}
