/// @desc REturns whether Flux is currently active. Useful for preventing code running while Flux is running.
function flux_is_running() {
	// Initialise Flux if required
	__flux_init();
	
	// Return Flux Active
	return global.__flux_active;
}