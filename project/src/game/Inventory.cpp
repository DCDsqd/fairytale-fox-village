#include "Inventory.hpp"

godot::Inventory::Inventory()
{
}

godot::Inventory::~Inventory()
{
}

void godot::Inventory::add(Ingredient* ingr, int amount)
{
	ingredients[ingr] += amount;
}

int godot::Inventory::get_amount(godot::Ingredient* ingr) noexcept
{
	return ingredients[ingr];
}
