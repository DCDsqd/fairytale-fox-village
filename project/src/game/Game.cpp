#include "Game.hpp"
#include "Player.hpp"
//#include "GameData.hpp"

void godot::Game::additional_init(godot::Player* _player)
{
	player = _player;
	correct = true;
}

void godot::Game::activate_quest(godot::Quest* quest)
{
	active_quests.push_back(quest);
}

void godot::Game::deactivate_quest(godot::Quest* quest)
{
	for (int i = 0; i < active_quests.size(); ++i) {
		if (active_quests[i] == quest) {
			active_quests.erase(active_quests.begin() + i, active_quests.begin() + i + 1);
			break;
		}
	}
}

godot::Array godot::Game::get_all_active_quests()
{
	godot::Array arr;
	for (int i = 0; i < active_quests.size(); ++i) {
		arr.push_back(active_quests[i]);
	}
	return arr;
}

godot::String godot::Game::current_time_str() const noexcept
{
	godot::String s(time);
	return s + ":00";
}

int godot::Game::current_time() const noexcept
{
	return time;
}

int godot::Game::current_day() const noexcept
{
	return day;
}

void godot::Game::add_gold(int i) {
	gold += i;
}

int godot::Game::get_gold() {
	return gold;
}

bool godot::Game::add_hour()//::GameData* game_data)
{
	if (time == DAY_END_TIME) {
		++day;
		time = DAY_START_TIME;
		//game_data->update_quests_status_on_day_switch(day);
		return true;
	}
	++time;
	return false;
}

bool godot::Game::game_over() const
{
	if (day >= DAY_END_TIME) {
		return true;
	}
	return false;
}
