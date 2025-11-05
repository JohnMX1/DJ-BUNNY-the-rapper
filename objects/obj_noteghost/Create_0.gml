global.note_left_held = sprite_add(string(global.loaded_mod)+"/spr_doublenotes_left.png", 4, false, false, 32, 32);
global.note_right_held = sprite_add(string(global.loaded_mod)+"/spr_doublenotes_right.png", 4, false, false, 32, 32);
global.note_up_held = sprite_add(string(global.loaded_mod)+"/spr_doublenotes_up.png", 4, false, false, 32, 32);
global.note_down_held = sprite_add(string(global.loaded_mod)+"/spr_doublenotes_down.png", 4, false, false, 32, 32);
global.note_sprite = sprite_add(string(global.loaded_mod)+"/spr_notes_normal.png", 4, false, false, 32, 32);
global.held_notes_sprite = sprite_add(string(global.loaded_mod)+"/spr_longnotes.png", 3, false, false, 32, 32);

sprite_index = global.note_sprite;
image_speed = 0;