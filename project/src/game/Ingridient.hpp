#pragma once

#include <set>
#include <memory>

#include <Godot.hpp>
#include <Node.hpp>

namespace godot{

class Ingridient : public Node {
	
	GODOT_CLASS(Ingridient, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Ingridient);
	}

	void _init() {};

private:
	int id;
	godot::String name;
	godot::String type;
	int cost;
};

} //namespace godot