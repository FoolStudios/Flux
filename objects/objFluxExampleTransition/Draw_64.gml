var _message = $"Flux {FLUX_VERSION}\n" + 
				"Example Room Transition\n\n"+
				"Press Space Bar to Transition Rooms\n\n" + 
				"This Example will show how to create a simple transfer between two rooms.\n" +
				"This utiised the event system, we are first going to Fade Out, transition room and fade in.\n" +
				"This will use two difference sequence assets";
draw_set_font(fntFlux);
draw_text(0, 0, _message);