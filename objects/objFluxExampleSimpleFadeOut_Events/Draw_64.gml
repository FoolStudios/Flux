var _message = $"Flux {FLUX_VERSION}\n" + 
				"Example Fade Out with Events\n\n"+
				"Press Space Bar to Fade Out\n\n" + 
				"This Example will show how to create a Simple Flux Sequence\n" +
				"which includes an event. Upon fade out reaching frame 25, the event is called.";
draw_set_font(fntFlux);
draw_text(0, 0, _message);