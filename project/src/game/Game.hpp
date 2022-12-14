#pragma once

#include <memory>
#include <set>
#include <vector>

#include <Godot.hpp>
#include <Node.hpp>

#include "GodotOutputTest.hpp"
#include "Quest.hpp"

#define DAY_START_TIME 8
#define DAY_END_TIME 22
#define FIRST_DAY 1
#define LAST_DAY 4

namespace godot
{

class Player;
//class GameData;

class Game : public Node
{
	GODOT_CLASS(Game, Node)

public:
    Game() = default;
    ~Game() = default;

    static void _register_methods()
    {
        register_method("init", &Game::additional_init);
        register_method("test_godot_output", &Game::test_godot_output);
        register_method("current_time_str", &Game::current_time_str);
        register_method("current_time", &Game::current_time);
        register_method("day_start_time", &Game::day_start_time);
        register_method("day_end_time", &Game::day_end_time);
        register_method("first_day", &Game::first_day);
        register_method("last_day", &Game::last_day);
        register_method("current_day", &Game::current_day);
        register_method("add_hour", &Game::add_hour);
        register_method("is_correct", &Game::is_correct);
        register_method("add_gold", &Game::add_gold);
        register_method("get_gold", &Game::get_gold);
        register_method("activate_quest", &Game::activate_quest);
        register_method("deactivate_quest", &Game::deactivate_quest);
        register_method("game_over", &Game::game_over);
        register_method("get_all_active_quests", &Game::get_all_active_quests);
        //register_method("", &Game);
    }
    
    void _init() {};
    void additional_init(Player* _player);

    inline bool is_correct() const noexcept { return correct; }
    inline int day_start_time() noexcept { return DAY_START_TIME; }
    inline int day_end_time() noexcept { return DAY_END_TIME; }
    inline int first_day() noexcept { return FIRST_DAY; }
    inline int last_day() noexcept { return LAST_DAY; }

    void activate_quest(Quest* quest);
    void deactivate_quest(Quest* quest);
    godot::Array get_all_active_quests();

    inline godot::String test_godot_output() 
    {
        return GodotOutputTest::greatings_func();
    }

    godot::String current_time_str() const noexcept;
    int current_time() const noexcept;
    int current_day() const noexcept;
    bool add_hour();//godot::GameData* game_data);
    bool game_over() const;

    void add_gold(int i);
    int get_gold();

private:
    bool correct = false;
    Player* player = nullptr;
    int time = DAY_START_TIME;
    int day = FIRST_DAY;
    int gold = 300;
    std::vector<Quest*> active_quests;
    //std::vector<Quest*> all_quests;
};

} //namespace godot