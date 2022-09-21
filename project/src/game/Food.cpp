#include "Food.hpp"

void godot::Food::bind_values(int _id, godot::String _name, godot::Array ingr_reqs, godot::String _type, int _cost)
{
	id = _id;
	name = _name;
	for (int i = 0; i < ingr_reqs.size(); ++i) {
		ingridients.push_back(static_cast<Ingredient*>(ingr_reqs[i]));
	}
	type = _type;
	cost = _cost;
}

godot::Array godot::Food::get_ingridients()
{
	godot::Array arr;
	for (const auto i : ingridients) {
		arr.push_back(i);
	}
	return arr;
}
