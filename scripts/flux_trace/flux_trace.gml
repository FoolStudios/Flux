function flux_trace(_source, _line, _message, _abort = true){
	var _error = "----------------------------------------------------------\n" +
				 "FLUX ERROR\n" +
				 "----------------------------------------------------------\n" +
				 $"VERSION {FLUX_VERSION}\n" +
				 $"ERROR OCCURED: {_source} (Line : {_line})\n" +
				 "----------------------------------------------------------\n" +
				 $"{_message}\n" +
				 "----------------------------------------------------------";
				 
	show_error(_error, _abort);
}