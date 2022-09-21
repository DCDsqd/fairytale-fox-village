#pragma once

#include <vector>
#include <set>
#include <memory>

#include <Godot.hpp>
#include <Node.hpp>

#include "Food.hpp"
#include "Civilian.hpp"
#include "Dialog.hpp"

namespace godot {

class Quest : public Node {

	GODOT_CLASS(Quest, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Quest);
		register_method("bind_values", &Quest::bind_values);
		register_method("add_food_targets", &Quest::add_food_targets);
	}

	void _init() {};
	
	void bind_values(int _id, godot::String _name, godot::String _descr, Civilian* _asker, Civilian* _receiver, Dialog* _start_dialog, Dialog* _end_dialog);
	void add_food_targets(godot::Array gd_targets);

private:
	int id;
	godot::String name;
	godot::String descr;
	bool completed = false;
	std::vector<Food*> targets;
	Civilian* asker = nullptr;
	Civilian* receiver = nullptr;
	Dialog* start_dialog;
	Dialog* end_dialog;
};

} //namespace godot