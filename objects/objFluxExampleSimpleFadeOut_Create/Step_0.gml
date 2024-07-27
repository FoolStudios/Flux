// Prevent Running if Flux is Running
if(flux_is_running()) return;

// Do not run if completed
if(completed) return;

// Check for Spacebar input
if(keyboard_check_pressed(vk_space)) {
	// You can create flux sequence before starting it by calling flux_create or flux_create_ext
	var _seq = flux_create(seqFadeOutExample);
	
	// You then pass in the _seq variable
	flux_start(_seq);
	
	// Set Completed Flag
	completed = true;
}