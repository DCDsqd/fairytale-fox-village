#pragma once

#include <vector>

#include <Godot.hpp>


namespace godot {

class Quest;

class Civilian {

private:
	godot::String name;
	int id;
	Quest* quest;
};

} //namespace godot