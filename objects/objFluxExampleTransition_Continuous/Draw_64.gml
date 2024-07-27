var _message = $"Flux {FLUX_VERSION}\n" + 
				"Example Room Transition\n\n"+
				"Press Space Bar to Transition Rooms\n\n" + 
				"This Example will show how to create a simple transfer between two rooms.\n" +
				"This utiised the event system, we are using a sequence that fades out and fades in.\n"+
				"This will show preserving sequences";
draw_set_font(fntFlux);
draw_text(0, 0, _message);