#pragma once

#include <vector>
#include <set>
#include <vector>
#include <algorithm>

#include <Godot.hpp>
#include <Node.hpp>

#include "Civilian.hpp"

namespace godot {

class Dialog : public Node {

	GODOT_CLASS(Dialog, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Dialog::);
		register_method("add_phrase_to_conv", &Dialog::add_phrase_to_conv);
		register_method("set_dialog_id", &Dialog::set_dialog_id);
		register_method("insure_conv_sequence", &Dialog::insure_conv_sequence);
		register_method("get_dialog_id", &Dialog::get_dialog_id);
		register_method("get_conv_elem", &Dialog::get_conv_elem);
		register_method("conv_size", &Dialog::conv_size);
	}

	void _init() {};

	//void bind_values(godot::Array dialog_info);
	void set_dialog_id(int id);
	void add_phrase_to_conv(Civilian* speaker, godot::String text, int idx);
	void insure_conv_sequence();
	inline int get_dialog_id() const { return dialog_id; };
	godot::Array get_conv_elem(int idx);
	inline int conv_size() const { return (int)conv.size(); };

private:
	std::vector<std::tuple<Civilian*, godot::String, int>> conv;
	int dialog_id = -1;
	bool valid = false;
};

} //namespace godot