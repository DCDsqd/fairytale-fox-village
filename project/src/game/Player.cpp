#include "Player.hpp"

void godot::Player::additional_init(Game* _game)
{
	game = _game;
	correct = true;
}

void godot::Player::inv_add_ingredients(Ingredient* ingr, int amount)
{
	inventory.add(ingr, amount);
}

int godot::Player::inv_get_ingredients_cnt(Ingredient* ingr)
{
	return inventory.get_amount(ingr);
}

godot::Array godot::Player::inv_get_available_food(godot::Array& all_food)
{
	godot::Array ans;
	for (int i = 0; i < all_food.size(); ++i) {
		Food* cur_food = static_cast<Food*>(all_food[i]);
		godot::Array ingr_reqs = cur_food->get_ingridients();
		bool satisf = true;
		for (int j = 0; j < ingr_reqs.size(); ++j) {
			Ingredient* cur_ingr = static_cast<Ingredient*>(ingr_reqs[j]);
			if (!inventory.get_amount(cur_ingr)) {
				satisf = false;
				break;
			}
		}
		if (satisf) {
			ans.push_back(cur_food);
		}
	}
	return ans;
}
