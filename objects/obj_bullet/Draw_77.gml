// Happens every single frame. But After all the drawing and rendering.

/*
	Doing this instance of a collision check because it will
	still draw the first frame out for visual effect.
*/
if(place_meeting(x,y,obj_wall_parent)) {
	instance_destroy();
}