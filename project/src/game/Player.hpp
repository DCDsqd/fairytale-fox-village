#pragma once

#include <memory>
#include <set>

#include <Godot.hpp>
#include <Node.hpp>

#include "Game.hpp"

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
    }

    void _init() {};

	void additional_init(Game* _game);
	inline bool is_correct() const noexcept { return correct; };
	inline Game* get_game() { return game; };

private:
	bool correct = false;
	Game* game = nullptr;
};

} //namespace godot