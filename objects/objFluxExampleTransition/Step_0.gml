// Prevent Running if Flux is Running
if(flux_is_running()) return;


// Check for Spacebar input
if(keyboard_check_pressed(vk_space)) {
	// We are going to pass the target room in as an argument based on our current room
	var _target = room == rmFluxExampleTransition_Start ? room_target_2 : room_target_1;
	
	// You can create flux sequence before starting it by calling flux_create or flux_create_ext
	var _seq = flux_create(seqFadeOutExample);
	
	// You can set an event by calling the addEvent function from the flux sequence
	// You will set the frame position, callback and its caller (normally self)
	// Caller will always be the first parameter of any callback with the second be an array of arguments
	_seq.addEvent(26, function(_caller, _args) {
		// We want to Prepare the Room For Fade In
		flux_room_goto(_args[0], seqFadeInExample);
	}, self, [_target]);
	
	// You then pass in the _seq variable
	flux_start(_seq);
}