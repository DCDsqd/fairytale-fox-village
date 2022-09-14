#include "Game.hpp"

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
