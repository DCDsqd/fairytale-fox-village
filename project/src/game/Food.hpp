#pragma once

#include <vector>
#include <set>
#include <memory>

#include <Godot.hpp>
#include "Node.hpp"

#include "Ingridient.hpp"

namespace godot {

class Food : public Node {

	GODOT_CLASS(Food, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Food::);
		register_method("bind_values", &Food::bind_values);
		register_method("get_name", &Food::get_name);
		register_method("get_id", &Food::get_id);
		register_method("get_ingridients", &Food::get_ingridients);
		register_method("get_type", &Food::get_type);
	}

	void _init() {};

	void bind_values(int _id, godot::String _name, godot::Array ingr_reqs, godot::String _type);
	inline godot::String get_name() const { return name; };
	inline int get_id() const { return id; };
	godot::Array get_ingridients();
	inline godot::String get_type() const { return type; };

private:
	godot::String name;
	int id;
	godot::String type;
	std::vector<Ingridient*> ingridients;
};

} //namespace godot