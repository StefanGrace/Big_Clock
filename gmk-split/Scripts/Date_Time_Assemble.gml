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