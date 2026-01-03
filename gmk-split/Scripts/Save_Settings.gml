//Save_Settings
//Stefan Grace
//Created 2021-12-31
//Modifed 2021-12-31
//Saves the color and format settings to a txt file

var file;
file = file_text_open_write("settings.txt");

var save_text;
switch (background_color)
{
    case colors[0]: save_text = "a"; break;
    case colors[1]: save_text = "b"; break;
    case colors[2]: save_text = "c"; break;
    case colors[3]: save_text = "d"; break;
    case colors[4]: save_text = "e"; break;
}
switch (draw_get_color())
{
    case colors[0]: save_text += "a"; break;
    case colors[1]: save_text += "b"; break;
    case colors[2]: save_text += "c"; break;
    case colors[3]: save_text += "d"; break;
    case colors[4]: save_text += "e"; break;
}
switch(date_format)
{
    case 0: save_text += "a"; break;
    case 1: save_text += "b"; break;
    case 2: save_text += "c"; break;
}
if (!worded_month) {save_text += "a";} else {save_text += "b";}
if (_12hour) {save_text += "a";} else {save_text += "b";}

file_text_write_string(file, save_text);
file_text_close(file);
