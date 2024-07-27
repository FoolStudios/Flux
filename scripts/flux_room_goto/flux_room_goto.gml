/// @desc Quick Function for transitioning room while calling the flux_room_prepare function.
/// feather ignore all
/// @param room
/// @param sequence
/// @param [events]
/// @param [preserve]
function flux_room_goto(_room, _sequence, _events = false, _preserve = false){
	// Prepare for Next Room
	flux_room_prepare(_sequence, _events, _preserve);
	// Go to Room
	room_goto(_room);
}