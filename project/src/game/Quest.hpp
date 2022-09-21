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
	}

	void _init() {};

private:
	godot::String name;
	godot::String descr;
	bool completed = false;
	std::vector<Food> targets;
	Civilian* receiver_id = nullptr;
	Dialog start_dialog;
	Dialog finish_dialog;
};

} //namespace godot