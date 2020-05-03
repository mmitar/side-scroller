p_vsp = p_vsp + p_grv;

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
	sprite_index = spr_e_jim_j;
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
		sprite_index = spr_e_jim_i;
	} else {
		sprite_index = spr_e_jim_r;
	}
}

// 
if (p_hsp != 0) {
	image_xscale = sign(p_hsp);	
}