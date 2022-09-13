#include <Godot.hpp>
#include <Node.hpp>
#include <memory>
#include <set>

namespace godot
{
    class My_Module : public Node {
        GODOT_CLASS(My_Module, Node);
    public:
        static void _register_methods()
        {
            register_method("my_func", &My_Module::my_func);
        }

        void _init()
        {
        }

        void my_func() {
            
        }

    };
} //namespace godot
