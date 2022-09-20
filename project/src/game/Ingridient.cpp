#include "Ingridient.hpp"

void godot::Ingridient::bind_values(int _id, godot::String _name, int _type, int _cost, int _available)
{
	id = _id;
	name = _name;
	type = _type;
	cost = _cost;
	available = _available;
}
