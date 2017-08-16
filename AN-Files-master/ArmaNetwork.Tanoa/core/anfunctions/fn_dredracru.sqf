if!(count life_run_data isEqualTo 0) then {
	_index = [(getPlayerUID player),life_run_data] call life_fnc_kuthaxadrep;
	if(_index != -1) exitWith {hintSilent "You are already running for president.";};
	createDialog "angovcand_menu";
} else {
	createDialog "angovcand_menu";
};

