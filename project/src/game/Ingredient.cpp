#include "Ingredient.hpp"

void godot::Ingredient::bind_values(int _id, godot::String _name, int _type, int _available, int _cost)
{
	id = _id;
	name = _name;
	type = _type;
	cost = _cost;
	available = _available;
}
