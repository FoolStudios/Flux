/// @desc Sets up flux to handle drawing in the next room.
/// @params sequence
/// @params [copy_events]
/// @params [preserve]
function flux_room_prepare(_sequence, _events = false, _preserve = false){
	// Create a Flux Sequence
	if(_sequence == undefined || _sequence < 0) {
		_sequence = flux_create(global.__flux_sequence.sequence);
		// Check if we need to move over events
		if(_events) {
			_sequence.events = global.__flux_sequence.events;	
		}
	} else if(asset_get_type(_sequence) == asset_sequence) {
		_sequence = flux_create(_sequence);
	}
	
	// Set Preservation Target
	global.__flux_sequence_target = _sequence;
	
	// Checks whether to preserve the headpos
	global.__flux_preserve = _preserve;
}