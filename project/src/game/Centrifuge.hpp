#pragma once

#include <memory>
#include <set>
#include <map>

#include <Godot.hpp>
#include <Node.hpp>

#include "Ingredient.hpp"

namespace godot {

class Centrifuge : public Node {

	GODOT_CLASS(Centrifuge, Node);

public:
	static void _register_methods()
	{
		register_method("get_ingridient", &Centrifuge::get_ingridient);
	}

	void _init() {};

	Centrifuge() = default;
	~Centrifuge() = default;

	const Ingredient* get_ingridient(const Ingredient* from);

private:
	std::map<const Ingredient*, const Ingredient*> ingridient_map;
};

} //namespace godot