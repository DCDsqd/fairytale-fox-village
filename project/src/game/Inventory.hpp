#pragma once

#include <vector>
#include <map>

#include <Godot.hpp>

#include "Ingredient.hpp"

namespace godot {

class Inventory {
public:
	Inventory();
	~Inventory();

	void add(Ingredient* ingr, int amount = 1);
	int get_amount(Ingredient* ingr) noexcept;
private:
	std::map<Ingredient*, int> ingredients;
};

} //namespace godot