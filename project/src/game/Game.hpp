#pragma once

#include <memory>
#include <set>

#include <Godot.hpp>
#include <Node.hpp>

#include "GodotOutputTest.hpp"

namespace godot
{

class Game : public Node
{
	GODOT_CLASS(Game, Node)

public:
    Game() = default;
    ~Game() = default;

    static void _register_methods()
    {
        register_method("test_godot_output", &Game::test_godot_output);
    }

    void _init()
    {
    }

    godot::String test_godot_output() 
    {
        return GodotOutputTest::greatings_func();
    }
};

} //namespace godot