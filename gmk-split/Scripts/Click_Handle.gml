//Click_Handle
//Stefan Grace
//Created 2021-12-30
//Modifed 2026-01-03

var i;
var j;
var option;
j = 0;
option = -1;
for (i = (room_height / 2) + 230; i < room_height; i += 24)
{
    if (mouse_y > i && mouse_y < i + 24) {option = j;}
    j += 1;
}

if (option == -1) {exit;}

if (mouse_x > (room_width / 2) - 450 && mouse_x < (room_width / 2) - 250)
// Background options
{
    if (draw_get_color() != colors[option])
    {
        background_color = colors[option];
    }
    else 
    {
        show_message("Background cannot be the same color as font.#Change font color first.");
    }
}
else if (mouse_x > (room_width / 2) - 250 && mouse_x < (room_width / 2) - 50)
// Font options
{
    if (background_color != colors[option])
    {
        draw_set_color(colors[option]);
    }
    else 
    {
        show_message("Font cannot be the same color as background.#Change background color first.");
    }
}
else if (mouse_x > (room_width / 2) - 50 && mouse_x < (room_width / 2) + 150)
// Date format options
{
    switch (option)
    {
        case 0: date_format = 0; break;
        case 1: date_format = 1; break;
        case 2: date_format = 2; break;
    }
}
else if (mouse_x > (room_width / 2) + 150 && mouse_x < (room_width / 2) + 350)
// Month format options
{
    switch (option)
    {
        case 0: worded_month = false; break;
        case 1: worded_month = true; break;
    }
}
else if (mouse_x > (room_width / 2) + 350 && mouse_x < (room_width / 2) + 550)
// Time format options
{
     switch (option)
    {
        case 0: _12hour = true; break;
        case 1: _12hour = false; break;
    }
}

Save_Settings();
