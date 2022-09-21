#include "Centrifuge.hpp"

const godot::Ingredient* godot::Centrifuge::get_ingridient(const godot::Ingredient* from)
{
	return ingridient_map[from];
}