function __flux_step(){
	// Check if need to create a Flux Controller
	if(FLUX_USE_OBJECET && !instance_exists(objFluxController)) {
		global.__flux_object = instance_create_depth(0, 0, FLUX_LAYER_DEPTH, objFluxController);
	}
	
	// Ensure that Layer are Setup Correctly
	if(global.__flux_layer == -1) {
		__flux_refresh();	
	}
	
	// Destroy Old Sequence
	if(global.__flux_sequence_old != undefined && global.__flux_sequence_old.onTimer()) {
		global.__flux_sequence_old = undefined;
	}
	
	// Do not continue if not active
	if(!global.__flux_active) {
		// Ensure Head Position is -1
		global.__flux_headpos_old = -1;
		return;
	}
	
	// Do not run if flux_sequence is undefined
	if(global.__flux_sequence == undefined || !flux_is_sequence_struct(global.__flux_sequence)) {
		global.__flux_sequence = undefined;
		global.__flux_active = false;
		return;
	}
	
	// Set Head Pos for Previous Frame
	global.__flux_headpos_old = global.__flux_headpos;
	global.__flux_headpos = global.__flux_sequence.getHeadpos();
	
	// Return if Paused
	if(global.__flux_paused) {
		return;	
	}
	
	// Update Tick Event
	global.__flux_sequence.onStep();
	
	// Return if sequence is playing
	if(!global.__flux_sequence.isFinished()) {
		return;	
	}
	
	// Handle Destruction
	if(global.__flux_sequence.destroy) {
		global.__flux_sequence_old = global.__flux_sequence;
		global.__flux_sequence_old.timer = 1;
		global.__flux_sequence = undefined;
	}
	
	// Disable Active if Flux is undefined
	if(global.__flux_sequence == undefined) {
		global.__flux_active = false;	
	}
	
}