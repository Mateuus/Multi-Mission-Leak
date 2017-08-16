/*
	fn_glockenspiel.sqf
	Author: G00golplexian
	
	Description: Plays a serial of bells one after another.
*/
private["_mode","_pos"];

_mode = _this select 0;
_pos = _this select 1;


switch(_mode) do {

	case 0: {
	playsound3D ["a3\sounds_f\ambient\objects\bell_small.wss", nil, false, _pos, 1, 0.5, 0];
	sleep 1.9; 
	playsound3D ["a3\sounds_f\ambient\objects\bell_small.wss", nil, false, _pos, 1, 0.7, 0];
	sleep 1.6; 
	playsound3D ["a3\sounds_f\ambient\objects\bell_small.wss", nil, false, _pos, 1, 0.9, 0];
	};

	case 1: {
	playsound3D ["a3\sounds_f\ambient\objects\bell_big.wss", nil, false, _pos, 1, 1.4, 0];
	sleep 1; 
	playsound3D ["a3\sounds_f\ambient\objects\bell_big.wss", nil, false, _pos, 1, 1, 0];
	sleep 1.5; 
	playsound3D ["a3\sounds_f\ambient\objects\bell_big.wss", nil, false, _pos, 1, 1.2, 0];
	sleep 1;
	playsound3D ["a3\sounds_f\ambient\objects\bell_big.wss", nil, false, _pos, 1, 1.15, 0];
	};
};