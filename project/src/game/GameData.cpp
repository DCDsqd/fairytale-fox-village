#include "GameData.hpp"

void godot::GameData::add_civilian(Civilian* civ)
{
	all_civilians.push_back(civ);
}

godot::Civilian* godot::GameData::get_civilian(int idx)
{
	return all_civilians[idx];
}

void godot::GameData::add_ingridient(Ingridient* ingr)
{
	all_ingridients.push_back(ingr);
}

godot::Ingridient * godot::GameData::get_ingridient(int idx)
{
	return all_ingridients[idx];
}

godot::Array godot::GameData::get_ingridient_mult(godot::Array idxs)
{
	godot::Array arr;
	for (int i = 0; i < idxs.size(); ++i) {
		arr.push_back(get_ingridient(i));
	}
	return arr;
}

void godot::GameData::add_food(Food* food)
{
	all_food.push_back(food);
}

godot::Food* godot::GameData::get_food(int idx)
{
	return all_food[idx];
}
