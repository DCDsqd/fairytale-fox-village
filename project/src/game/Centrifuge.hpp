#pragma once

#include <memory>
#include <set>
#include <map>

#include <Godot.hpp>
#include <Node.hpp>

#include "Ingridient.hpp"

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

	const Ingridient* get_ingridient(const Ingridient* from);

private:
	std::map<const Ingridient*, const Ingridient*> ingridient_map;
};

} //namespace godot