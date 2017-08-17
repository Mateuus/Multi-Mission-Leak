
params [ 
	["_cop", objNull, [objNull]]
]; 

if !(side _cop isEqualTo west) exitWith { 
	Diag_log "Com Remove Error 1";
};
if !(_cop getVariable ["tied", false]) exitWith {
	Diag_log "Com Remove Error 2";
};

_cop unassignItem "ItemGPS";
_cop removeItem "ItemGPS";
_cop unassignItem "ItemMap";
_cop removeItem "ItemMap";

[] remoteExec ["life_fnc_comRemovalWait", _cop];
