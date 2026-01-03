//Load_Settings
//Stefan Grace
//Created 2021-12-31
//Modifed 2021-12-31
//Loads the color and format settings from a txt file

// If there is no settings file to load from, exit this script and use the default settings
if (!file_exists("settings.txt")) {exit;}

var file;
file = file_text_open_read("settings.txt");

var save_text;
save_text = file_text_read_string(file);
switch(string_char_at(save_text, 1))
{
    case "a": background_color = colors[0]; break;
    case "b": background_color = colors[1]; break;
    case "c": background_color = colors[2]; break;
    case "d": background_color = colors[3]; break;
    case "e": background_color = colors[4]; break;
}
switch(string_char_at(save_text, 2))
{
    case "a": draw_set_color(colors[0]); break;
    case "b": draw_set_color(colors[1]); break;
    case "c": draw_set_color(colors[2]); break;
    case "d": draw_set_color(colors[3]); break;
    case "e": draw_set_color(colors[4]); break
}
switch(string_char_at(save_text, 3))
{
    case "a": date_format = 0; break;
    case "b": date_format = 1; break;
    case "c": date_format = 2; break;
}
switch(string_char_at(save_text, 4))
{
    case "a": worded_month = false; break;
    case "b": worded_month = true; break;
}
switch(string_char_at(save_text, 5))
{
    case "a": _12hour = true; break;
    case "b": _12hour = false; break;
}

file_text_close(file);

