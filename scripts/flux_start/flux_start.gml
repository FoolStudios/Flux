//------------------------------------------------------------------------------------------
// FLUX START
//------------------------------------------------------------------------------------------
/// @desc Play the Flux Sequence
/// @params flux_sequence
function flux_start(_seq) {
	// Initialise Flux if required
	__flux_init();
	
	// Create a Flux Sequence from a Sequence ASset
	if(!is_struct(_seq) && asset_get_type(_seq) == asset_sequence) {
		_seq = flux_create(_seq);	
	}
	
	// Throw Error if not a valid sequence
	if(!flux_is_sequence_struct(_seq)) {
		flux_trace("flux_start", 14, "The input sequence parameters is not a Flux Sequence. Ensure that \"flux_create\" or \"flux_create_ext\" is used to create a flux sequence.", true);	
	}
	
	// Destroy Old Sequence if it exists and move current to old
	if(global.__flux_sequence != undefined) {
		// Clear Old Sequence
		if(global.__flux_sequence_old != undefined) {
			global.__flux_sequence_old.onDestroy();	
		}
		// Set the Current Sequence to Old
		global.__flux_sequence_old = global.__flux_sequence;
		global.__flux_sequence_old.clear_timer = 1;
		global.__flux_sequence = undefined;
	}
	
	// Copy Struct to the main sequence
	global.__flux_sequence = _seq;
	
	// Get the X and Y of the Display
	var _x = display_get_gui_width() div 2;
	var _y = display_get_gui_height() div 2;
	
	// Create the Sequence
	global.__flux_sequence.onCreate(_x, _y, global.__flux_layer);
	
	// Set Flux Flags
	global.__flux_active = true;
	global.__flux_paused = false;
	
	
	
}