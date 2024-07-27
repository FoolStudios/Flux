//------------------------------------------------------------------------------------------
// FLUX LAYER BEGIN
//------------------------------------------------------------------------------------------
// Handles the Drawing of Flux to a Surface by first clearing the surface. This is done
// at the start of the ev_draw_normal event
//------------------------------------------------------------------------------------------
function flux_layer_begin(){
	if(!global.__flux_active) return;
	
	// Return if not correct event
	if(event_type != ev_draw) return
	
	// Return if not on the correct number
	if(event_number != 0) return;
	
	// Create the Surface if no surface exists
	if(global.__flux_surface == -1 || !surface_exists(global.__flux_surface)) {
		global.__flux_surface = surface_create(FLUX_SURFACE_WIDTH, FLUX_SURFACE_HEIGHT);
	}
	
	// Set Surface Target
	surface_set_target(global.__flux_surface);
	
	// Set Transparency
	draw_clear_alpha(FLUX_SURFACE_COLOUR, FLUX_SURFACE_ALPHA);
}