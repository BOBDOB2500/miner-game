
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