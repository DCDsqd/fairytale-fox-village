#pragma once

#include <memory>
#include <set>

#include <Godot.hpp>
#include <Node.hpp>

namespace godot 
{

class GodotOutputTest
{
public:
    GodotOutputTest() = default;
    ~GodotOutputTest() = default;

    static godot::String greatings_func() 
    {
        return "ciao godot";
    }
    
};

} //namespace godot