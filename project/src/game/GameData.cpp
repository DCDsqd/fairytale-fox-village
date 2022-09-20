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
