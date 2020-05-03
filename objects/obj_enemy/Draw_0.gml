/*
	Adding Draw event overwrites the default draw of the sprite.
*/

// Draw the original sprite
draw_self();

// When hit by a bullet
if (p_flash > 0) {
	
	// Decrement flash frame duration 
	p_flash--;
	// Add white shader
	shader_set(sh_white);
	draw_self();
	// Resets back to default draw
	shader_reset();
}