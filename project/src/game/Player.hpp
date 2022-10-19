#pragma once

#include <memory>
#include <set>

#include <Godot.hpp>
#include <Node.hpp>

#include "Game.hpp"
#include "Inventory.hpp"
#include "Ingredient.hpp"
#include "Food.hpp"
#include "GameData.hpp"

namespace godot {

class Player : public Node {

	GODOT_CLASS(Player, Node);

public:
	Player() = default;
	~Player() = default;

    static void _register_methods()
    {
		register_method("init", &Player::additional_init);
		register_method("is_correct", &Player::is_correct);
		register_method("get_game", &Player::get_game);
		register_method("inv_add_ingredients", &Player::inv_add_ingredients);
		register_method("inv_get_ingredients_cnt", &Player::inv_get_ingredients_cnt);
		register_method("inv_add_food", &Player::inv_add_food);
		register_method("inv_get_food_cnt", &Player::inv_get_food_cnt);
		register_method("inv_get_available_food", &Player::inv_get_available_food);
		register_method("inv_get_most_exp_food_available", &Player::inv_get_most_exp_food_available);
		register_method("inv_get_all_food_cnt", &Player::inv_get_all_food_cnt);
		register_method("inv_get_all_ingr_cnt", &Player::inv_get_all_ingr_cnt);
    }

    void _init() {};

	void additional_init(Game* _game);
	inline bool is_correct() const noexcept { return correct; };
	inline Game* get_game() { return game; };
	void inv_add_ingredients(Ingredient* ingr, int amount = 1);
	int inv_get_ingredients_cnt(Ingredient* ingr);
	void inv_add_food(Food* food, int amount = 1);
	int inv_get_food_cnt(Food* food);
	godot::Array inv_get_available_food(GameData* game_data);
	int inv_get_all_food_cnt() const;
	int inv_get_all_ingr_cnt() const;
	Food* inv_get_most_exp_food_available(godot::Array quest_list) const;

private:
	bool correct = false;
	Game* game = nullptr;
	Inventory inventory;
};

} //namespace godot