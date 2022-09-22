#pragma once

#include <memory>
#include <set>

#include <Godot.hpp>
#include <Node.hpp>

#include "Game.hpp"
#include "Inventory.hpp"
#include "Ingredient.hpp"
#include "Food.hpp"

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
		register_method("inv_get_available_food", &Player::inv_get_available_food);
    }

    void _init() {};

	void additional_init(Game* _game);
	inline bool is_correct() const noexcept { return correct; };
	inline Game* get_game() { return game; };
	void inv_add_ingredients(Ingredient* ingr, int amount = 1);
	int inv_get_ingredients_cnt(Ingredient* ingr);
	godot::Array inv_get_available_food(godot::Array& all_food);

private:
	bool correct = false;
	Game* game = nullptr;
	Inventory inventory;
};

} //namespace godot