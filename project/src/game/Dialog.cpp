#include "Dialog.hpp"

/*
void godot::Dialog::bind_values(godot::Array dialog_info)
{
	for (int i = 0; i < dialog_info.size(); ++i) {
		for (int j = 0; j < dialog_info[i].operator size_t(); ++j) {

		}
	}
}
*/

void godot::Dialog::set_dialog_id(int id)
{
	dialog_id = id;
	valid = true;
}

void godot::Dialog::add_phrase_to_conv(Civilian* speaker, godot::String text, int idx)
{
	auto [SPEAKER, TEXT, IDX] = std::make_tuple(speaker, text, idx);
	conv.push_back({ SPEAKER, TEXT, IDX });
}

void godot::Dialog::insure_conv_sequence()
{
	std::sort(conv.begin(), conv.end(), [](const std::tuple<Civilian*, godot::String, int>& a, const std::tuple<Civilian*, godot::String, int>& b) {
		return std::get<2>(a) < std::get<2>(b);
	});
}

godot::Array godot::Dialog::get_conv_elem(int idx)
{
	godot::Array arr;
	arr.append(std::get<0>(conv[idx]));
	arr.append(std::get<1>(conv[idx]));
	arr.append(std::get<2>(conv[idx]));
	return arr;
}
