// Prevent Running if Flux is Running
if(flux_is_running()) return;

// Do not run if completed
if(completed) return;

// Check for Spacebar input
if(keyboard_check_pressed(vk_space)) {
	// You can create flux sequence before starting it by calling flux_create or flux_create_ext
	var _seq = flux_create(seqFadeOutExample);
	
	// You can set an event by calling the addEvent function from the flux sequence
	// You will set the frame position, callback and its caller (normally self)
	// Caller will always be the first parameter of any callback with the second be an array of arguments
	_seq.addEvent(25, function(_caller) {
		show_debug_message("Fade Out Completed");
		
		// Set the Caller's Completed Flag
		_caller.completed = true;
	}, self);
	
	// You then pass in the _seq variable
	flux_start(_seq);
}