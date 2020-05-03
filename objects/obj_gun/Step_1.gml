/*
	Using begin step (BS) to simulate weight to the gun
	because BS calc's position a frame before the player.
*/

// Just drop the gun and skip the rest of logic.
if (!instance_exists(obj_player)) {
	y = y + g_grv;
	exit;
}

// Position the gun on the player
x = obj_player.x;
y = obj_player.y+6;

// Angle the gun where the mouse is pointing
image_angle = point_direction(x,y,mouse_x,mouse_y);

// Setting a delay between shots
g_firing_delay = g_firing_delay - 1;
g_recoil = max(0,g_recoil-1);
	
if (mouse_check_button(mb_left)) and (g_firing_delay < 0) {
		
	g_recoil = g_recoil_max;
	g_firing_delay = g_firing_delay_max;
	
	// Create bullet in "Bullets" instance.
	with(instance_create_layer(x,y, "Bullets",obj_bullet)) {
		
		// Set bullet speed. Set direction/angle to that of gun.
		//speed = 25;
		direction = other.image_angle + random_range(-3,3); // Random spread.
		image_angle = direction;
	}
}

// Gun recoil
x = x - lengthdir_x(g_recoil,image_angle);
y = y - lengthdir_y(g_recoil,image_angle);

// Flip the gun around when hitting y-axis.
if (image_angle > 90 && image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}
