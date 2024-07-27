// Prevent Running if Flux is Running
if(flux_is_running()) return;

// Do not run if completed
if(completed) return;

// Check for Spacebar input
if(keyboard_check_pressed(vk_space)) {
	// Passing in a Sequence Asset will automatically work, however no events can be added.
	flux_start(seqFadeOutExample);
	
	// Set Completed Flag
	completed = true;
}