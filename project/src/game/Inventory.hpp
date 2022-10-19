#pragma once

#include <vector>
#include <map>
#include <set>

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

	int inv_get_all_food_cnt() const;
	int inv_get_all_ingr_cnt() const;

	std::vector<Food*> get_all_unique_food() const;
private:
	std::map<Ingredient*, int> ingredients;
	std::map<Food*, int> food;
};

} //namespace godot