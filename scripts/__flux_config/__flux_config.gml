//------------------------------------------------------------------------------------------
// FLUX CONFIGURATION
//------------------------------------------------------------------------------------------
// The following macros will help determine how Flux will run. There are a number of 
// variables that you will want to change or may have to make rooms match the macros.
//
// Be sure to read the comments with each macro as they will explain what each of the 
// macros does
//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
// FLUX CONTROL
//------------------------------------------------------------------------------------------

// By default, Flux initialises all variables when the game launches. You shouldn't change
// this, however if you want to initialise Flux at a different point, set this to false.
// This will stop __flux_init from being called at game start.
#macro	FLUX_INITIALISE_ON_STARTUP			true

// By default, Flux uses an object called objFluxController to handle the drawing, 
// refreshing and destruction of the Flux system. Setting this to false will mean this
// object is not created. You will want to ensure that __flux_draw, __flux_refresh and 
// __flux_destroy are called somewhere within the game loop otherwise Flux will fail to run.
#macro	FLUX_USE_OBJECET					true

//------------------------------------------------------------------------------------------
// LAYER CONFIGURATION
//------------------------------------------------------------------------------------------

// When trying to find the layer that Flux will be placed on, it will first look for the 
// layer id by name. If this layer doesn't exist, there is however a backup.
// During design, the Transition Layer is an asset layer.
#macro	FLUX_LAYER_NAME						"aTransitions"

// If Flux is unable to find a layer with the name above, it will instead create a layer
// at the given depth. The way flux works, the depth /shouldn't/ matter but if you
// end up placing anything on the flux layer, you will want to ensure the depth is
// correct and ideal for what you need
#macro	FLUX_LAYER_DEPTH					-10000


//------------------------------------------------------------------------------------------
// SURFACE CONFIGURATION
//------------------------------------------------------------------------------------------

// Flux utilises Surfaces in order to display the transitions. By default this is based on
// the gui width and height. This should work fine for most games, but you may want to 
// change these values
#macro	FLUX_SURFACE_WIDTH					display_get_gui_width()
#macro	FLUX_SURFACE_HEIGHT					display_get_gui_height()

// When creating a surface, Flux creates a clear alpha, these variables shouldn't really 
// need to be changed as they work. But you can change them if you so wish
#macro	FLUX_SURFACE_COLOUR					c_black
#macro	FLUX_SURFACE_ALPHA					0.0
