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
