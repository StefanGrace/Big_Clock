#define Date_Time_Assemble
//Date & Time Assemble
//Stefan Grace
//Created 2016-05-16
//Modifed 2021-12-30
//This Scrip assembles the currect date and time

//Makes the months and days have leading zeros if they are less than ten
if (current_month < 10) {current_month_leading_zero = "0" + string(current_month);} else {current_month_leading_zero = string(current_month);}
if (current_day < 10) {current_day_leading_zero = "0" + string(current_day);} else {current_day_leading_zero = string(current_day);}
if (current_hour < 10) {current_hour_leading_zero = "0" + string(current_hour);} else {current_hour_leading_zero = string(current_hour);}
if (current_minute < 10) {current_minute_leading_zero = "0" + string(current_minute);} else {current_minute_leading_zero = string(current_minute);}
if (current_second < 10) {current_second_leading_zero = "0" + string(current_second);} else {current_second_leading_zero = string(current_second);}

//Makes the month be a word of the month format is worded
if (worded_month) {current_month_leading_zero = months[current_month];}

//Assembels the elements of the date and time
switch (date_format)
{
    case 0:
        date_text = current_day_leading_zero + "-" + current_month_leading_zero + "-" + string(current_year);
        break;
    case 1:
        date_text = current_month_leading_zero + "-" + current_day_leading_zero + "-" + string(current_year);
        break;
    case 2:
        date_text = string(current_year) + "-" + current_month_leading_zero + "-" + current_day_leading_zero;
        break;
}
if (_12hour)
{
    if (current_hour < 1)
    {
        hour12 = 12;
    } 
    else if (current_hour < 13) 
    {
        hour12 = current_hour;
    }
    else
    {
        hour12 = current_hour - 12;
    }
    if (current_hour < 12) {AM_PM = "AM";} else {AM_PM = "PM";}
    time_text = string(hour12) + ":" + current_minute_leading_zero + ":" + current_second_leading_zero + " " + AM_PM;
}
else
{
    time_text = current_hour_leading_zero + ":" + current_minute_leading_zero + ":" + current_second_leading_zero;
}

date_time_text = date_text + " " + time_text;

//Assemble *'s
if (background_color == make_color_rgb(0,0,0)) {background_star[0] = "*";} else {background_star[0] = "";}
if (background_color == make_color_rgb(64,64,64)) {background_star[1] = "*";} else {background_star[1] = "";}
if (background_color == make_color_rgb(128,128,128)) {background_star[2] = "*";} else {background_star[2] = "";}
if (background_color == make_color_rgb(192,192,192)) {background_star[3] = "*";} else {background_star[3] = "";}
if (background_color == make_color_rgb(255,255,255)) {background_star[4] = "*";} else {background_star[4] = "";}

if (draw_get_color() == make_color_rgb(0,0,0)) {font_star[0] = "*";} else {font_star[0] = "";}
if (draw_get_color() == make_color_rgb(64,64,64)) {font_star[1] = "*";} else {font_star[1] = "";}
if (draw_get_color() == make_color_rgb(128,128,128)) {font_star[2] = "*";} else {font_star[2] = "";}
if (draw_get_color() == make_color_rgb(192,192,192)) {font_star[3] = "*";} else {font_star[3] = "";}
if (draw_get_color() == make_color_rgb(255,255,255)) {font_star[4] = "*";} else {font_star[4] = "";}

if (date_format == 0) {date_format_star[0] = "*";} else {date_format_star[0] = "";}
if (date_format == 1) {date_format_star[1] = "*";} else {date_format_star[1] = "";}
if (date_format == 2) {date_format_star[2] = "*";} else {date_format_star[2] = "";}

if (!worded_month) {month_format_star[0] = "*";} else {month_format_star[0] = "";}
if (worded_month) {month_format_star[1] = "*";} else {month_format_star[1] = "";}

if (_12hour) {time_format_star[0] = "*";} else {time_format_star[0] = "";}
if (!_12hour) {time_format_star[1] = "*";} else {time_format_star[1] = "";}

background_stars = "";
var i;
for (i = 0; i < 5; i += 1)
{
    background_stars += background_star[i] + "#";
}

font_stars = "";
var i;
for (i = 0; i < 5; i += 1)
{
    font_stars += font_star[i] + "#";
}

date_format_stars = "";
var i;
for (i = 0; i < 3; i += 1)
{
    date_format_stars += date_format_star[i] + "#";
}

month_format_stars = "";
var i;
for (i = 0; i < 2; i += 1)
{
    month_format_stars += month_format_star[i] + "#";
}

time_format_stars = "";
var i;
for (i = 0; i < 2; i += 1)
{
    time_format_stars += time_format_star[i] + "#";
}


#define Date_Time_Draw
//Date & Time Draw
//Stefan Grace
//Created 2016-07-29
//Modifed 2022-01-01
//This script draws the final date and time text

// Draw date and time
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (room_width < 1600) draw_set_font(font_small) else draw_set_font(font_big);
draw_text(room_width / 2, room_height / 2, date_time_text);

// Draw options
if (options_hidden) {exit;}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_option_bold);
draw_text((room_width / 2) - 450, (room_height / 2) + 200, "Background");
draw_text((room_width / 2) - 250, (room_height / 2) + 200, "Font");
draw_text((room_width / 2) - 50, (room_height / 2) + 200, "Date format");
draw_text((room_width / 2) + 150, (room_height / 2) + 200, "Month format");
draw_text((room_width / 2) + 350, (room_height / 2) + 200, "Time format");
draw_set_font(font_option);
draw_text((room_width / 2) - 430, (room_height / 2) + 230, "Black#Dark gray#Medium gray#Light gray#White");
draw_text((room_width / 2) - 230, (room_height / 2) + 230, "Black#Dark gray#Medium gray#Light gray#White");
draw_text((room_width / 2) - 30, (room_height / 2) + 230, "Day-Month-Year#Month-Day-Year#Year-Month-Day");
draw_text((room_width / 2) + 170, (room_height / 2) + 230, "Number#Word");
draw_text((room_width / 2) + 370, (room_height / 2) + 230, "12-hour#24-hour");

// Draw *'s
draw_text((room_width / 2) - 450, (room_height / 2) + 230, background_stars);
draw_text((room_width / 2) - 250, (room_height / 2) + 230, font_stars);
draw_text((room_width / 2) - 50, (room_height / 2) + 230, date_format_stars);
draw_text((room_width / 2) + 150, (room_height / 2) + 230, month_format_stars);
draw_text((room_width / 2) + 350, (room_height / 2) + 230, time_format_stars);

// Draw keyboard shortcut text
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if (room_height < 900) 
{
    draw_text(room_width / 2, (room_height / 2) - 200, "Space = Hide/show options,  Esc = Exit");
}
else
{
    draw_text(room_width / 2, (room_height / 2) + 420, "Space = Hide/show options,  Esc = Exit");
}


#define Set_Resolution
// Set_Resolution
// Stefan Grace
// Created: 2018-05-13
// Modified: 2018-05-13
// This scripts sets the resolution of the room the the currect screen resolution

room_set_width(room_main, display_get_width())
room_set_height(room_main, display_get_height())
room_goto(room_main)


#define Set_Variables
//Set_Variables
//Stefan Grace
//Created 2021-12-20
//Modifed 2021-12-31

//Months
months[1] = "Jan";
months[2] = "Feb";
months[3] = "Mar";
months[4] = "Apr";
months[5] = "May";
months[6] = "Jun";
months[7] = "Jul";
months[8] = "Aug";
months[9] = "Sep";
months[10] = "Oct";
months[11] = "Nov";
months[12] = "Dec";

//Formats
text_color = 0;
date_format = 2;
worded_month = false;
_12hour = false;

//Colors
colors[0] = make_color_rgb(0,0,0);
colors[1] = make_color_rgb(64,64,64);
colors[2] = make_color_rgb(128,128,128);
colors[3] = make_color_rgb(192,192,192);
colors[4] = make_color_rgb(255,255,255);

//Load settings from txt file
Load_Settings();


#define Click_Handle
//Click_Handle
//Stefan Grace
//Created 2021-12-30
//Modifed 2021-12-31

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
        show_message("Background cannot be the same color as font.#Chnage font color first.");
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
        show_message("Font cannot be the same color as background.#Chnage background color first.");
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


#define Save_Settings
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


#define Load_Settings
//Load_Settings
//Stefan Grace
//Created 2021-12-31
//Modifed 2021-12-31
//Loads the color and format settings from a txt file

// If there is not settings file to load from, exit this script and use the default settings
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


