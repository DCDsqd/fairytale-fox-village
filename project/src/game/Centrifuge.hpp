#include <memory>
#include <set>
#include <map>

#include <Godot.hpp>
#include <Node.hpp>

#include "Ingridient.hpp"

namespace godot {

class Centrifuge : public Node {

	GODOT_CLASS(Centrifuge, Node);

public:
	static void _register_methods()
	{
		//register_method("", &Centrifuge);
	}

	void _init() {};

	Centrifuge() = default;
	~Centrifuge() = default;

	

private:
	std::map<Ingridient, Ingridient> ingridient_map;
};

} //namespace godot