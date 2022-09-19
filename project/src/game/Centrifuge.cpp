#include "Centrifuge.hpp"

const godot::Ingridient* godot::Centrifuge::get_ingridient(const godot::Ingridient* from)
{
	return ingridient_map[from];
}