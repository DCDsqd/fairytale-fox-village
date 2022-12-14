#include <Godot.hpp>
#include <Node.hpp>
#include <memory>
#include <set>

#include "../game/Game.hpp"
#include "../game/Player.hpp"
#include "../game/Centrifuge.hpp"
#include "../game/Ingredient.hpp"
#include "../game/Civilian.hpp"
#include "../game/Food.hpp"
#include "../game/GameData.hpp"
#include "../game/Quest.hpp"
#include "../game/Dialog.hpp"

namespace godot
{

    extern "C" void GDN_EXPORT godot_gdnative_init(godot_gdnative_init_options * o)
    {
        godot::Godot::gdnative_init(o);
    }

    extern "C" void GDN_EXPORT godot_gdnative_terminate(godot_gdnative_terminate_options * o)
    {
        godot::Godot::gdnative_terminate(o);
    }

    extern "C" void GDN_EXPORT godot_nativescript_init(void* handle)
    {
        godot::Godot::nativescript_init(handle);
        godot::register_class<godot::Game>();
        godot::register_class<godot::Player>();
        godot::register_class<godot::Centrifuge>();
        godot::register_class<godot::Ingredient>();
        godot::register_class<godot::GameData>();
        godot::register_class<godot::Civilian>();
        godot::register_class<godot::Food>();
        godot::register_class<godot::Quest>();
        godot::register_class<godot::Dialog>();
    }

} //namespace godot