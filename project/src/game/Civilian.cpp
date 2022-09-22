#include "Civilian.hpp"
#include "GameData.hpp"
#include "Quest.hpp"

void godot::Civilian::bind_values(int _id, godot::String _name, godot::String _catch_phrase)
{
	id = _id;
	name = _name;
	catch_phrase = _catch_phrase;
}

godot::Quest* godot::Civilian::get_quest(godot::GameData* game_data, int cur_day)
{
	std::vector<Quest*> all_quests; // = game_data->get_all_quests_cpp_ref();
	for (auto q : all_quests) {
		if (q->get_asker() == this && q->is_available(cur_day)) {
			return q;
		}
	}
	return nullptr;
}