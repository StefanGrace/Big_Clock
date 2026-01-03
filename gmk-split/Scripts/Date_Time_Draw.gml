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
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(font_option_bold)
draw_text((room_width / 2) - 450, (room_height / 2) + 200, "Background");
draw_text((room_width / 2) - 250, (room_height / 2) + 200, "Font");
draw_text((room_width / 2) - 50, (room_height / 2) + 200, "Date format");
draw_text((room_width / 2) + 150, (room_height / 2) + 200, "Month format");
draw_text((room_width / 2) + 350, (room_height / 2) + 200, "Time format");
draw_set_font(font_option)
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