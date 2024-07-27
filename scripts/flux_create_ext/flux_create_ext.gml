//------------------------------------------------------------------------------------------
// FLUX SEQUENCE
//------------------------------------------------------------------------------------------
/// feather ignore all
/// @desc Creates a Flux Struct
/// @params sequence_asset
/// @params speedscale
/// @params rotation
/// @params destroy
function flux_create_ext(_sequence, _speed, _rotation, _destroy) {
	// Initialise Flux if required
	__flux_init();
	
	return {
		// The Sequence Asset to Use
		sequence: _sequence,
		// The Element that is placed on the layer
		element: undefined,
		// The Speed of the Sequence
		speed: _speed,
		// The Rotation of the sequence
		rotation: _rotation,
		// Whether to Destroy the Sequence upon completion
		destroy: _destroy,
		// The Event System
		events: {},
		// The Clear Delay Timer
		clear_timer: 0,
		
		/// @desc Create the Sequence Element
		onCreate: function(_x, _y, _layer) {
			// Create the Element
			element = layer_sequence_create(_layer, _x, _y, sequence);
			// Change the Speed and Angle
			layer_sequence_speedscale(element, speed);
			layer_sequence_angle(element, rotation);
		},
		/// @desc Step the Sequence Element
		onStep: function() {
			// Do not run if no element
			if(element == undefined) return;	
			
			// Also do not run if headpos and old headpos are the same
			if(global.__flux_headpos == global.__flux_headpos_old) return;
			
			// Get the Event Array
			var _event = events[$ global.__flux_headpos];
			
			// Return if null or array length is 0
			if(_event == undefined || array_length(_event) == 0) return;
			
			// Iterate Through the Events Array
			var _i = 0;
			repeat(array_length(_event)) {
				// Execute the Event
				_event[_i].onExecute();
				// Revmoe from Array to prevent cases where it could cause
				// an infinite loop.
				if(_event[_i].clear) {
					array_delete(_event, _i, 1);
					continue;
				}
				// Increment Index
				++_i;
			}
		},
		/// @desc Destroy the Sequence Element
		onDestroy: function() {
			// Return if there is no element
			if(element == undefined || !layer_sequence_exists(global.__flux_layer, element)) return;
			// Destroy the element
			layer_sequence_destroy(element);
			// Nullify Element
			element = undefined;
		},
		/// @desc Handles the Clearing of the Element
		onTimer: function() {
			// Return if no element or clear_timer is 0
			if(clear_timer == 0 || element == undefined) return true;
			
			// Decrement Clear Timer
			clear_timer--;
			
			// Return if not zero
			if(clear_timer != 0) return false;
			
			// Destroy the Element
			onDestroy();
			
			// Return true
			return true;
		},
		/// @desc Create an Event at the head position
		/// @param frame
		/// @param callback
		/// @param [caller]
		/// @param [args]
		/// @param [clear]
		addEvent: function(_pos, _callback, _caller = self, _args = [], _clear = true) {
			// Create an Array if current position is undefined
			if(events[$ _pos] == undefined) events[$ _pos] = [];
			
			// Create the Event
			array_push(events[$ _pos], {
				callback: _callback,
				caller: _caller,
				args: _args,
				clear: _clear,
				/// @desc Executes the Event
				onExecute: function() {
					callback(caller, args);	
				}
			});
		},
		/// @desc Sets the Sequence Headpos
		/// @param frame
		setHeadpos: function(_pos) {
			// Return if no element
			if(element == undefined) return;
			
			// Set the Head position
			layer_sequence_headpos(element, _pos);
		},
		/// @desc Sets the Sequence Speed
		/// @param speed
		setSpeed: function(_speed) {
			// Return if no element
			if(element == undefined) return;
			
			// Set the Speed Variable
			speed = _speed;
			
			// Set the Head position
			layer_sequence_speedscale(element, _speed);
		},
		/// @desc Sets the Sequence Rotation
		/// @param rotation
		setRotation: function(_rotation) {
			// Return if no element
			if(element == undefined) return;
			
			// Set the Speed Variable
			rotation = _rotation;
			
			// Set the Head position
			layer_sequence_angle(element, _rotation);
		},
		/// @desc Get the Current Head Position
		getHeadpos: function() {
			return layer_sequence_get_headpos(element);	
		},
		/// @desc Checks to see if the Sequence is finished
		isFinished: function() {
			// Return true if element doesn't exist or flux isn't active
			if(element == undefined || !global.__flux_active) return true;
			
			// REturn based on element
			return layer_sequence_is_finished(element);
		},
		// Flux Struct (just for validating the struct as a flux sequence)
		__flux_struct: true,
	}
}