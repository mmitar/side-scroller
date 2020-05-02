// Player Input
key_left = keyboard_check(vk_left) or keyboard_check(ord("A")); // Returns 0 or -1.
key_right = keyboard_check(vk_right) or keyboard_check(ord("D")); // Returns 0 or 1.
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
	Collision and Movement Calculations
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


/*
	Animation
=============================================
*/

// If jumping off the ground, set the proper running animation
if (!place_meeting(x,y+1,obj_wall_parent)) {
	sprite_index = spr_player_jump;
	image_speed = 0;
	
	if(sign(p_vsp) > 0) {
		// Falling
		image_index = 1;
	} else {
		// Jumping
		image_index = 0;
	}
} 
// When on the floor
else {
	image_speed = 1;
	// Not Moving
	if (p_hsp == 0) {
		sprite_index = spr_player_idle;
	} else {
		sprite_index = spr_player_walk;
	}
}

// 
if (p_hsp != 0) {
	image_xscale = sign(p_hsp);	
}