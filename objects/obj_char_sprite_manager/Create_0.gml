function get_spite(name, action, dir) {
    return asset_get_index("spr_"+name+"_"+action+"_"+dir);
}

function get_idle(name, dir) {
    return get_spite(name, "idle", dir);
}

function get_walk(name, dir) {
    return get_spite(name, "walk", dir);
}