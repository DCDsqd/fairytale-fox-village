#pragma once

#include <vector>

#include <Godot.hpp>

#include "Ingridient.hpp"

namespace godot {

class Food {

private:
	godot::String name;
	int id;
	std::vector<Ingridient> ingridients;
};

} //namespace godot