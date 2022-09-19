#include <vector>

#include <Godot.hpp>

namespace godot {

class Dialog {

private:
	std::vector<std::pair<godot::String, godot::String>> conv;
	int id;
};

} //namespace godot