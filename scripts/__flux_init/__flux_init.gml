//------------------------------------------------------------------------------------------
// FLUX STARTUP
//------------------------------------------------------------------------------------------
if(FLUX_INITIALISE_ON_STARTUP) {
	__flux_init();	
}

//------------------------------------------------------------------------------------------
// FLUX MACROS (DO NOT EDIT)
//------------------------------------------------------------------------------------------
#macro	FLUX_VERSION			"2.0.0.0"

//------------------------------------------------------------------------------------------
// FLUX INITIALISE
//------------------------------------------------------------------------------------------
// Initialises the Flux System, will be called within other functions to ensure that Flux
// has been initialised.
//------------------------------------------------------------------------------------------
function __flux_init(){
	// Ensure Flux Init is only called once
	if(variable_global_exists("__flux_initialised")) return;
	
	// Flux Sequences
	global.__flux_sequence			= undefined;
	global.__flux_sequence_old		= undefined;
	global.__flux_sequence_target	= undefined;
	
	// Flux State
	global.__flux_active			= false;
	global.__flux_paused			= false;
	
	// Flux Layer and Surface
	global.__flux_layer				= -1;
	global.__flux_surface			= -1;
	
	// Flux Room Presevation
	global.__flux_preserve			= false;
	
	// Flux Object Controller
	global.__flux_object			= noone;
	
	// Flux Sequence Head Position
	global.__flux_headpos			= -1;
	global.__flux_headpos_old		= -1;
	
	// Create a Flux time source
	global.__flux_time_source		= time_source_create(time_source_global, 1, time_source_units_frames, __flux_step, [], -1);
	time_source_start(global.__flux_time_source);
	
	// Set Initialised Flag
	global.__flux_initialised		= true;
}