#pragma once

#include <set>
#include <memory>

#include <Godot.hpp>
#include <Node.hpp>

namespace godot{

class Ingredient : public Node {
	
	GODOT_CLASS(Ingredient, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Ingridient);
		register_method("bind_values", &Ingredient::bind_values);
		register_method("get_const", &Ingredient::get_cost);
		register_method("get_type", &Ingredient::get_type);
		register_method("get_id", &Ingredient::get_id);
		register_method("get_name", &Ingredient::get_name);
		register_method("is_available", &Ingredient::is_available);
	}

	void _init() {};

	void bind_values(int _id, godot::String _name, int _type, int _available, int _cost);
	inline int get_cost() const { return cost; };
	inline int get_type() const { return type; };
	inline int get_id() const { return id; };
	inline godot::String get_name() const { return name; };
	inline int is_available() const { return available; };
	
private:
	int id;
	godot::String name;
	int type;
	int cost;
	int available;
};

} //namespace godot