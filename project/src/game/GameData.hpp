#pragma once

#include <set>
#include <memory>
#include <vector>

#include <Godot.hpp>
#include <Node.hpp>

#include "Civilian.hpp"
#include "Dialog.hpp"
#include "Ingridient.hpp"
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
		register_method("add_ingridient", &GameData::add_ingridient);
		register_method("get_ingridient", &GameData::get_ingridient);
		register_method("get_ingridient_mult", &GameData::get_ingridient_mult);
		register_method("total_ingridients", &GameData::total_ingridients);
		register_method("add_food", &GameData::add_food);
		register_method("get_food", &GameData::get_food);
		register_method("total_foods", &GameData::total_food);
	}

	void _init() {};

	inline int total_civilians() const {
		return (int)all_civilians.size();
	};
	inline int total_ingridients() const {
		return (int)all_ingridients.size();
	};
	inline int total_food() const {
		return (int)all_food.size();
	};

	void add_civilian(Civilian* civ);
	Civilian* get_civilian(int idx);

	void add_ingridient(Ingridient* ingr);
	Ingridient* get_ingridient(int idx);
	godot::Array get_ingridient_mult(godot::Array idxs);

	void add_food(Food* food);
	Food* get_food(int idx);

private:
	std::vector<Civilian*> all_civilians;
	std::vector<Dialog*> all_dialogs;
	std::vector<Ingridient*> all_ingridients;
	std::vector<Quest*> all_quests;
	std::vector<Food*> all_food;
};

}