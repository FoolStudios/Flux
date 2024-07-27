/// @desc Resume Flux
function flux_resume() {
	// Initialise Flux if required
	__flux_init();
	
	// Set Pause to False
	global.__flux_paused = false;
}