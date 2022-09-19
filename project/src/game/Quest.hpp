#pragma once

#include <vector>

#include <Godot.hpp>

#include "Food.hpp"
#include "Civilian.hpp"
#include "Dialog.hpp"

namespace godot {

class Quest {

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