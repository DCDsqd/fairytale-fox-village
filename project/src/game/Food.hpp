#pragma once

#include <vector>
#include <set>
#include <memory>

#include <Godot.hpp>
#include <Node.hpp>

#include "Ingridient.hpp"

namespace godot {

class Food : public Node {

	GODOT_CLASS(Food, Node);

public:
    static void _register_methods()
    {
        //register_method("", &Food);
    }

    void _init() {};

private:
	godot::String name;
	int id;
	std::vector<Ingridient> ingridients;
};

} //namespace godot