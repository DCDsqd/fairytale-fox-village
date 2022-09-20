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
		register_method("bind_values", &Ingridient::bind_values);
		register_method("get_const", &Ingridient::get_cost);
		register_method("get_type", &Ingridient::get_type);
		register_method("get_id", &Ingridient::get_id);
		register_method("get_name", &Ingridient::get_name);
		register_method("is_available", &Ingridient::is_available);
	}

	void _init() {};

	void bind_values(int _id, godot::String _name, int _type, int _cost, int _available);
	inline int get_cost() const { return cost; };
	inline int get_type() const { return type; };
	inline int get_id() const { return id; };
	inline godot::String get_name() const { return name; };
	inline int is_available() const { return (int)available; };

private:
	int id;
	godot::String name;
	int type;
	int cost;
	bool available;
};

} //namespace godot