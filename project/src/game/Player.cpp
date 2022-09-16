#include "Player.hpp"

void godot::Player::additional_init(Game* _game)
{
	game = _game;
	correct = true;
}
