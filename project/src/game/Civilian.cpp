#include "Civilian.hpp"

void godot::Civilian::bind_values(int _id, godot::String _name, godot::String _catch_phrase)
{
	id = _id;
	name = _name;
	catch_phrase = _catch_phrase;
}
