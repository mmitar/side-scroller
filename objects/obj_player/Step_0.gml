key_left = keyboard_check(vk_left); // Returns 0 or -1.
key_right = keyboard_check(vk_right); // Returns 0 or 1.
key_jump = keyboard_check_pressed(vk_space); // Returns 0 or 1.

// Calculate Movespeed. Nuetrals out dual input. Needs a 1.
var move = key_right - key_left;
p_hsp = move * p_msp;
p_vsp = p_vsp + p_grv;

// Jump mechanics
if (place_meeting(x,y+1,obj_wall_parent) && key_jump) {
	p_vsp = -7;
}

/*
Collision and final calculations should happen last.
=============================================
*/
// Horizontal Collision
if (place_meeting(x+p_hsp,y,obj_wall_parent)) {
	// Incrementally check the players approach into the obj.
	while(!place_meeting(x+sign(p_hsp),y,obj_wall_parent)) {
		x += sign(p_hsp);
	}
	p_hsp = 0;
}

// Vertical Collision
if (place_meeting(x,y+p_vsp,obj_wall_parent)) {
	while(!place_meeting(x,y+sign(p_vsp),obj_wall_parent)) {
		y += sign(p_vsp);
	}
	p_vsp = 0;
}

// Final summation.
x = x + p_hsp;
y = y + p_vsp;
