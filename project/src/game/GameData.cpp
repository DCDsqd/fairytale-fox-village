#include "GameData.hpp"

void godot::GameData::add_civilian(Civilian* civ)
{
	all_civilians.push_back(civ);
}

godot::Civilian* godot::GameData::get_civilian(int idx)
{
	return all_civilians[idx];
}

void godot::GameData::add_ingredient(Ingredient* ingr)
{
	all_ingredients.push_back(ingr);
}

godot::Ingredient * godot::GameData::get_ingredient(int idx)
{
	return all_ingredients[idx];
}

godot::Array godot::GameData::get_ingredient_mult(godot::Array idxs)
{
	godot::Array arr;
	for (int i = 0; i < idxs.size(); ++i) {
		int cur_idx = idxs[i];
		arr.push_back(get_ingredient(cur_idx - 1));
	}
	return arr;
}

void godot::GameData::add_food(Food* food)
{
	all_food.push_back(food);
}

godot::Food* godot::GameData::get_food(int idx)
{
	return all_food[idx];
}

int godot::GameData::get_total_food()
{
	return all_food.size();
}

void godot::GameData::add_dialog(Dialog* diag)
{
	all_dialogs.push_back(diag);
}

godot::Dialog* godot::GameData::get_dialog(int id)
{
	return all_dialogs[id];
}

godot::Array godot::GameData::get_all_dialogs()
{
	godot::Array arr;
	for (int i = 0; i < all_dialogs.size(); ++i) {
		arr.append(all_dialogs[i]);
	}
	return arr;
}

void godot::GameData::add_quest(Quest* quest)
{
	all_quests.push_back(quest);
}

godot::Quest* godot::GameData::get_quest(int id)
{
	return all_quests[id];
}

godot::Array godot::GameData::get_all_quests()
{
	godot::Array arr;
	for (int i = 0; i < all_quests.size(); ++i) {
		arr.append(all_quests[i]);
	}
	return arr;
}

std::vector<godot::Quest*>& godot::GameData::get_all_quests_cpp_ref()
{
	return all_quests;
}

int godot::GameData::amount_of_failed_quests()
{
	int cnt = 0;
	for (auto q : all_quests) {
		if (q->get_status() == 3) {
			cnt++;
		}
	}
	return cnt;
}

//NOTE: This function is supposed to be performed AFTER the logical day switch
void godot::GameData::update_quests_status_on_day_switch(int new_day)
{
	for (auto q : all_quests) {
		if (q->get_day() == new_day - 1 && q->get_status() != 2) {
			q->set_failed();
		}
	}
}
