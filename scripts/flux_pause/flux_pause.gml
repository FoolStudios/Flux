/// @desc Pause Flux
function flux_pause() {
	// Initialise Flux if required
	__flux_init();
	
	// Set Pause to True
	global.__flux_paused = true;
}