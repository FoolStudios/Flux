//------------------------------------------------------------------------------------------
// FLUX LAYER END
//------------------------------------------------------------------------------------------
// Handles the Drawing of Flux to a Surface by reseting surface target. This is done
// at the end of the ev_draw_normal event
//------------------------------------------------------------------------------------------
function flux_layer_end(){
	if(!global.__flux_active) return;
	
	// Return if not correct event
	if(event_type != ev_draw) return
	
	// Return if not on the correct number
	if(event_number != 0) return;
	
	// Set Surface Target
	surface_reset_target();
}