
x_speed = 0

if (keyboard_check(vk_right)) {
    x_speed = walk_speed;
}
else if (keyboard_check(vk_left)) {
    x_speed = -walk_speed;
}


y_speed += 0.5

var on_ground = place_meeting(x, y + 1, oSolid)

if (on_ground && keyboard_check_pressed(vk_up)) {
    y_speed = -10
}

if (place_meeting(x, y + y_speed, oSolid)) {
    while (!place_meeting(x, y + sign(y_speed), oSolid)) {
        y += sign(y_speed)
    }
    y_speed = 0;
}

y += y_speed;

if (place_meeting(x + x_speed, y, oSolid)) {
    while (!place_meeting(x + sign(x_speed), y, oSolid)) {
        x += sign(x_speed)
    }
    x_speed = 0
}

x += x_speed

if (place_meeting(x, y, Object4)) {

    room_restart()

}

// Check if player is on the ground
var on_ground = place_meeting(x, y + 1, oSolid)

// Determine state
if (!on_ground) {
    if (y_speed < 0) {
        state = "jump"; // moving up
    } else {
        state = "fall"; // moving down
    }
} else if (x_speed != 0) {
    state = "walk"; // moving left/right
} else {
    state = "idle"; // standing still
}

// Optional: landing animation (only trigger on landing)
if (on_ground && state == "fall" && y_speed == 0) {
    state = "land";
}

switch(state) {
    case "idle":
        sprite_index = spr_player_idle;
        image_speed = 0.1; // idle animation speed
        break;
    case "walk":
        sprite_index = spr_player_walk;
        image_speed = 0.3; // walking speed
        break;
    case "jump":
        sprite_index = spr_player_jump;
        image_speed = 0; // freeze in midair or small frame change
        break;
    case "fall":
        sprite_index = spr_player_fall;
        image_speed = 0;
        break;
    case "land":
        sprite_index = spr_player_land;
        image_speed = 0.2; // landing animation
        break;
}