//------------------------------------------------------------------------------------------
// FLUX SEQUENCE
//------------------------------------------------------------------------------------------
/// @desc Creates a Flux Struct
/// @params sequence_asset
function flux_create(_seq){
	return flux_create_ext(_seq, 1, 0, true);
}