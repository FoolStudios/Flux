//------------------------------------------------------------------------------------------
// FLUX DRAWING
//------------------------------------------------------------------------------------------
// This handles the drawing of the surface. This is called in the Draw GUI End function
// If you have other Draw GUI End events that are drawing, ensure that they are drawn 
// before flux, otherwise things will be drawn above the surface.
//------------------------------------------------------------------------------------------
function __flux_draw(){
	// Create a surface if no surface exists
	if(global.__flux_surface == -1 || !surface_exists(global.__flux_surface)) {
		global.__flux_surface = surface_create(FLUX_SURFACE_WIDTH, FLUX_SURFACE_HEIGHT);	
	}
	
	// Draw the Surface to the Screen
	draw_surface(global.__flux_surface, 0, 0);
}