#include "Game.hpp"
#include "Player.hpp"

void godot::Game::additional_init(Player* _player)
{
	player = _player;
	correct = true;
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

bool godot::Game::add_hour()
{
	if (time == DAY_END_TIME) {
		++day;
		time = DAY_START_TIME;
		return true;
	}
	++time;
	return false;
}
