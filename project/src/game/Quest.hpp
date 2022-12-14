#pragma once

#include <vector>
#include <set>
#include <memory>

#include <Godot.hpp>
#include <Node.hpp>

#include "Food.hpp"
#include "Civilian.hpp"
#include "Dialog.hpp"

namespace godot {

class Quest : public Node {

	GODOT_CLASS(Quest, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Quest);
		register_method("bind_values", &Quest::bind_values);
		register_method("add_food_targets", &Quest::add_food_targets);
		register_method("get_id", &Quest::get_id);
		register_method("get_name", &Quest::get_name);
		register_method("get_descr", &Quest::get_descr);
		register_method("get_status", &Quest::get_status);
		register_method("get_targets", &Quest::get_targets);
		register_method("get_asker", &Quest::get_asker);
		register_method("get_receiver", &Quest::get_receiver);
		register_method("get_start_dialog", &Quest::get_start_dialog);
		register_method("get_end_dialog", &Quest::get_end_dialog);	
		register_method("get_day", &Quest::get_day);
		register_method("set_completed", &Quest::set_completed);
		register_method("set_in_prog", &Quest::set_in_prog);
		register_method("set_failed", &Quest::set_failed);
		register_method("get_reqs", &Quest::get_reqs);
		register_method("is_available", &Quest::is_available);
	}

	void _init() {};
	
	void bind_values(int _id, godot::String _name, godot::String _descr, Civilian* _asker, Civilian* _receiver, Dialog* _start_dialog, Dialog* _end_dialog, int _day);
	void add_food_targets(godot::Array gd_targets);
	inline int get_id() const { return id; };
	inline godot::String get_name() const { return name; };
	inline godot::String get_descr() const { return descr; };
	inline int get_status() const { return status; };
	godot::Array get_targets();
	inline Civilian* get_asker() { return asker; };
	inline Civilian* get_receiver() { return receiver; };
	inline Dialog* get_start_dialog() { return start_dialog; };
	inline Dialog* get_end_dialog() { return end_dialog; };
	inline int get_day() { return day; };
	bool is_available(int cur_day);
	void set_completed();
	void set_failed();
	void set_in_prog();
	godot::Array get_reqs();

	enum QUEST_STATUS {
		NOT_COMPLETED = 0,
		IN_PROGRESS = 1,
		COMPLETED = 2,
		FAILED = 3
	};

private:
	int id;
	godot::String name;
	godot::String descr;
	int status = NOT_COMPLETED; //0 - not completed, 1 - in progress, 2 - completed, 3 - failed
	std::vector<Food*> targets;
	Civilian* asker = nullptr;
	Civilian* receiver = nullptr;
	Dialog* start_dialog;
	Dialog* end_dialog;
	int day;
};

} //namespace godot