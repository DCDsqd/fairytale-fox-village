#include "Inventory.hpp"

godot::Inventory::Inventory()
{
}

godot::Inventory::~Inventory()
{
}

void godot::Inventory::add_ingr(Ingredient* ingr, int amount)
{
	ingredients[ingr] += amount;
}

int godot::Inventory::get_amount_ingr(godot::Ingredient* ingr) noexcept
{
	return ingredients[ingr];
}

void godot::Inventory::add_food(Food* _food, int amount)
{
	food[_food] += amount;
}

int godot::Inventory::get_amount_food(Food* _food) noexcept
{
	return food[_food];
}

int godot::Inventory::inv_get_all_food_cnt() const
{
	return (int)food.size();
}

int godot::Inventory::inv_get_all_ingr_cnt() const
{
	return (int)ingredients.size();
}

std::vector<godot::Food*> godot::Inventory::get_all_unique_food() const
{
	std::vector<godot::Food*> v;
	for (auto [key, value] : food) {
		if (value > 0) {
			v.push_back(key);
		}
	}
	return v;
}
