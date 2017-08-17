
params [ 
	["_civ", objNull, [objNull]]
]; 

if !(side _civ isEqualTo civilian) exitWith { 
	Diag_log "Com Remove Error 1";
};
if !(_civ getVariable ["restrained", false]) exitWith {
	Diag_log "Com Remove Error 2";
};

_civ unassignItem "ItemGPS";
_civ removeItem "ItemGPS";
_civ unassignItem "ItemMap";
_civ removeItem "ItemMap";

[] remoteExec ["life_fnc_comRemovalWaitCiv", _civ];
