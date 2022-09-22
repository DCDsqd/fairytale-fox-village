#pragma once

#include <vector>
#include <set>
#include <memory>

#include <Godot.hpp>
#include <Node.hpp>

namespace godot {

class Quest;

class Civilian : public Node {

	GODOT_CLASS(Civilian, Node);

public:

	static void _register_methods()
	{
		//register_method("", &Civilian::);
		register_method("get_name", &Civilian::get_name);
		register_method("get_id", &Civilian::get_id);
		register_method("get_catch_phrase", &Civilian::get_catch_phrase);
		register_method("bind_values", &Civilian::bind_values);
	}

	void _init() {};

	void bind_values(int _id, godot::String _name, godot::String _catch_phrase);

	inline godot::String get_name() const { return name; };
	inline int get_id() const { return id; };
	inline godot::String get_catch_phrase() const { return catch_phrase; };
private:
	godot::String name;
	int id;
	godot::String catch_phrase;
};

} //namespace godot