
_index = [getPlayerUid player,life_run_data] call fnc_index;
if(_index != -1) exitWith {hint "You are already running for governor."};

createDialog "life_candidate_menu";