#pragma once

#include <vector>
#include <map>

#include <Godot.hpp>

#include "Ingredient.hpp"
#include "Food.hpp"

namespace godot {

class Inventory {
public:
	Inventory();
	~Inventory();

	void add_ingr(Ingredient* ingr, int amount = 1);
	int get_amount_ingr(Ingredient* ingr) noexcept;

	void add_food(Food* _food, int amount = 1);
	int get_amount_food(Food* _food) noexcept;
private:
	std::map<Ingredient*, int> ingredients;
	std::map<Food*, int> food;
};

} //namespace godot