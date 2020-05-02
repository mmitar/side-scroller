/*
	Using begin step (BS) to simulate weight to the gun
	because BS calc's position a frame before the player.
*/


if (!instance_exists(obj_player)) {
	y = y + g_grv;
	
} else {
	// Position the gun on the player
	x = obj_player.x;
	y = obj_player.y+6;

	// Angle the gun where the mouse is pointing
	image_angle = point_direction(x,y,mouse_x,mouse_y);

	// Setting a delay between shots
	g_firingdelay = g_firingdelay - 1;
	if (mouse_check_button(mb_left)) and (g_firingdelay < 0) {
		g_firingdelay = 5;
		// Create bullet in "Bullets" instance.
		with(instance_create_layer(x,y, "Bullets",obj_bullet)) {
			// Set bullet speed. Set direction/angle to that of gun.
			speed = 25;
			direction = other.image_angle;
			image_angle = direction;
		}
	}

	// Flip the gun around when hitting y-axis.
	if (image_angle > 90 && image_angle < 270) {
		image_xscale = -1;
		image_angle += 180;
	} else {
		image_xscale = 1;
	}
}