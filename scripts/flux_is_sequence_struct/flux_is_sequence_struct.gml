function flux_is_sequence_struct(_struct){
	if(!is_struct(_struct)) return false;
	
	return struct_exists(_struct, "__flux_struct");
}