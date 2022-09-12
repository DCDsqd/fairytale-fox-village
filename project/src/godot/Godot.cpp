#include <Godot.hpp>
#include <Node.hpp>
#include <memory>
#include <set>
#include "../My_Module.hpp"

namespace godot 
{

class Example : public Node
{
    GODOT_CLASS(Example, Node)

public:
    static void _register_methods()
    {
        register_method("greatings_func", &Example::greatings_func);
    }

    void _init()
    {
    }

    String greatings_func()
    {
        return "ciao world";
    }
};

extern "C" void GDN_EXPORT godot_gdnative_init(godot_gdnative_init_options *o) 
{
    godot::Godot::gdnative_init(o);
}

extern "C" void GDN_EXPORT godot_gdnative_terminate(godot_gdnative_terminate_options *o) 
{
    godot::Godot::gdnative_terminate(o);
}

extern "C" void GDN_EXPORT godot_nativescript_init(void *handle) 
{
    godot::Godot::nativescript_init(handle);
    godot::register_class<godot::Example>();
    godot::register_class<godot::My_Module>();
}

} //namespace godot
