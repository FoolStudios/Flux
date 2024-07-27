//------------------------------------------------------------------------------------------
// FLUX DESTRUCTION
//------------------------------------------------------------------------------------------
// Handles the cleaning up of the Flux System. This should be called during the Destroy
// event of the controller object. This will destroy any existing sequences as well as 
// clear up the layers.
//
// This should also be called in the Game End function to prevent memory problems.
//------------------------------------------------------------------------------------------
function __flux_destroy(){
	// Destroy the Flux Time Source
	if(global.__flux_time_source != undefined && time_source_exists(global.__flux_time_source)) {
		time_source_destroy(global.__flux_time_source, true);
		global.__flux_time_source = undefined;
	}
	
	// Destroy the Flux Surface
	if(global.__flux_surface != -1 && surface_exists(global.__flux_surface)) {
		surface_free(global.__flux_surface);
		global.__flux_surface = -1;
	}
	
	// Destroy the Current Sequence if it exists
	if(global.__flux_sequence != -1 && is_struct(global.__flux_sequence)) {
		global.__flux_sequence.onDestroy();
		global.__flux_sequence = -1;
	}
	
	// Destroy the Old Sequence if it exists
	if(global.__flux_sequence_old != -1 && is_struct(global.__flux_sequence_old)) {
		global.__flux_sequence_old.onDestroy();
		global.__flux_sequence_old = -1;
	}
}