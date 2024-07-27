//------------------------------------------------------------------------------------------
// FLUX REFRESH
//------------------------------------------------------------------------------------------
// Handles ensuring that the Flux variables are set correctly. This event is called during
// both the create event of the Flux controller as well as in the Room Start event. This
// will set the variables to the current room.
//------------------------------------------------------------------------------------------
function __flux_refresh(){
	// Ensure the Target Layer Exists
	if(!layer_exists(FLUX_LAYER_NAME)) {
		layer_create(FLUX_LAYER_DEPTH, FLUX_LAYER_NAME);
	}
	
	// Set the Flux Layer
	global.__flux_layer = layer_get_id(FLUX_LAYER_NAME);
	
	// Set the Layer Script Events
	layer_script_begin(global.__flux_layer, flux_layer_begin);
	layer_script_end(global.__flux_layer, flux_layer_end);
	
	// Force the Creation of a sequence if there is a target
	if(global.__flux_sequence_target != undefined && is_struct(global.__flux_sequence_target)) {
		// Start the Sequence
		flux_start(global.__flux_sequence_target);
		
		// Force the Head Position if sequence was preserved
		if(global.__flux_preserve) {
			global.__flux_sequence.setHeadpos(global.__flux_headpos + 1);
			global.__flux_preserve = false;
		}
		
		// Clear Flux Target
		global.__flux_sequence_target = undefined;
	}
	
}