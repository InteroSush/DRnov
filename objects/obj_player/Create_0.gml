
dir = "down"
skin = "pers"

function set_idle() {
    sprite_index = obj_player_manager.get_idle(skin, dir);
}

var controls;