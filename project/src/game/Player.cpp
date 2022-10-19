#include "Player.hpp"

void godot::Player::additional_init(Game* _game)
{
	game = _game;
	correct = true;
}

void godot::Player::inv_add_ingredients(Ingredient* ingr, int amount)
{
	inventory.add_ingr(ingr, amount);
}

int godot::Player::inv_get_ingredients_cnt(Ingredient* ingr)
{
	return inventory.get_amount_ingr(ingr);
}

void godot::Player::inv_add_food(Food* food, int amount)
{
	inventory.add_food(food, amount);
}

int godot::Player::inv_get_food_cnt(Food* food)
{
	return inventory.get_amount_food(food);
}

godot::Array godot::Player::inv_get_available_food(GameData* game_data)
{
	godot::Array ans;
	for (int i = 0; i < game_data->total_food(); ++i) {
		Food* cur_food = game_data->get_food(i);
		godot::Array ingr_reqs = cur_food->get_ingridients();
		bool satisf = true;
		for (int j = 0; j < ingr_reqs.size(); ++j) {
			Ingredient* cur_ingr = ingr_reqs[j];
			if (inventory.get_amount_ingr(cur_ingr) < 1) {
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

int godot::Player::inv_get_all_food_cnt() const
{
	return inventory.inv_get_all_food_cnt();
}

int godot::Player::inv_get_all_ingr_cnt() const
{
	return inventory.inv_get_all_ingr_cnt();
}

godot::Food* godot::Player::inv_get_most_exp_food_available(godot::Array quest_list) const
{
	auto all_avail_food = inventory.get_all_unique_food();
	if (all_avail_food.empty()) {
		return nullptr;
	}
	std::sort(all_avail_food.begin(), all_avail_food.end(), godot::Food::comp_food_by_cost);
	int i = 0;
	if (quest_list.empty()) {
		return all_avail_food.front();
	}
	while (i < all_avail_food.size()) {
		for (size_t j = 0; j < quest_list.size(); ++j) {
			Quest* cur_quest = quest_list[i];
			auto food_targets = cur_quest->get_targets();
			if (food_targets.find(all_avail_food[i]) == -1) {
				return all_avail_food[i];
			}
		}
		++i;
	}
	return nullptr;
}
