#pragma once

#include <set>
#include <memory>
#include <vector>

#include <Godot.hpp>
#include <Node.hpp>

#include "Civilian.hpp"
#include "Dialog.hpp"
#include "Ingredient.hpp"
#include "Food.hpp"
#include "Quest.hpp"

namespace godot {

class GameData : public Node {

	GODOT_CLASS(GameData, Node);

public:
	static void _register_methods()
	{
		register_method("add_civilian", &GameData::add_civilian);
		register_method("get_civilian", &GameData::get_civilian);
		register_method("total_civilians", &GameData::total_civilians);
		register_method("add_ingredient", &GameData::add_ingredient);
		register_method("get_ingredient", &GameData::get_ingredient);
		register_method("get_ingredient_mult", &GameData::get_ingredient_mult);
		register_method("total_ingredients", &GameData::total_ingredients);
		register_method("add_food", &GameData::add_food);
		register_method("get_food", &GameData::get_food);
		register_method("total_foods", &GameData::total_food);
		register_method("add_dialog", &GameData::add_dialog);
		register_method("get_dialog", &GameData::get_dialog);
		register_method("total_dialogs", &GameData::total_dialogs);
		register_method("get_all_dialogs", &GameData::get_all_dialogs);
		register_method("get_quest", &GameData::get_quest);
		register_method("total_quests", &GameData::total_quests);
		register_method("get_all_quests", &GameData::get_all_quests);
		register_method("add_quest", &GameData::add_quest);
		register_method("total_quests", &GameData::total_quests);
		register_method("get_total_food", &GameData::get_total_food);
	}

	void _init() {};

	inline int total_civilians() const {
		return (int)all_civilians.size();
	};
	inline int total_ingredients() const {
		return (int)all_ingredients.size();
	};
	inline int total_food() const {
		return (int)all_food.size();
	};
	inline int total_dialogs() const {
		return (int)all_dialogs.size();
	};

	void add_civilian(Civilian* civ);
	Civilian* get_civilian(int idx);

	void add_ingredient(Ingredient* ingr);
	Ingredient* get_ingredient(int idx);
	godot::Array get_ingredient_mult(godot::Array idxs);

	void add_food(Food* food);
	Food* get_food(int idx);
	int get_total_food();

	void add_dialog(Dialog* diag);
	Dialog* get_dialog(int id);
	godot::Array get_all_dialogs();

	void add_quest(Quest* quest);
	Quest* get_quest(int id);
	godot::Array get_all_quests();
	std::vector<Quest*>& get_all_quests_cpp_ref();
	inline int total_quests() const noexcept { return (int)all_quests.size(); };

	int amount_of_failed_quests();
	void update_quests_status_on_day_switch(int new_day);

private:
	std::vector<Civilian*> all_civilians;
	std::vector<Dialog*> all_dialogs;
	std::vector<Ingredient*> all_ingredients;
	std::vector<Quest*> all_quests;
	std::vector<Food*> all_food;
};

}