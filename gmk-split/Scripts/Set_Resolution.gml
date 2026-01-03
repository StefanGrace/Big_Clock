// Set_Resolution
// Stefan Grace
// Created: 2018-05-13
// Modified: 2018-05-13
// This scripts sets the resolution of the room the the currect screen resolution

room_set_width(room_main, display_get_width())
room_set_height(room_main, display_get_height())
room_goto(room_main)