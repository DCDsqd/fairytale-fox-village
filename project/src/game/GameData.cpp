#include "GameData.hpp"

void godot::GameData::add_civilian(Civilian* civ)
{
	all_civilians.push_back(civ);
}

godot::Civilian* godot::GameData::get_civilian(int idx)
{
	return all_civilians[idx];
}

void godot::GameData::add_ingredient(Ingredient* ingr)
{
	all_ingredients.push_back(ingr);
}

godot::Ingredient * godot::GameData::get_ingredient(int idx)
{
	return all_ingredients[idx];
}

godot::Array godot::GameData::get_ingredient_mult(godot::Array idxs)
{
	godot::Array arr;
	for (int i = 0; i < idxs.size(); ++i) {
		arr.push_back(get_ingredient(i));
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

void godot::GameData::add_dialog(Dialog* diag)
{
	all_dialogs.push_back(diag);
}

godot::Dialog* godot::GameData::get_dialog(int id)
{
	return all_dialogs[id];
}
