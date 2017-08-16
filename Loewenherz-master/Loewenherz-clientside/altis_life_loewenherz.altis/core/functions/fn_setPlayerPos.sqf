
/*
Filename: fn_setPlayerPos.sqf

Description: save the tranfered position in a client var.

// [[_worldspace],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp;
*/
private ["_blackListedAreas","_distance"];
lhm_lastPosition = param [0,[],[[]]];

// Validate position
if (typename lhm_lastPosition != "ARRAY" || count lhm_lastPosition != 2) then {
	lhm_lastPosition = [];
} else {
	systemChat localize"STR_INIT_POS";
	{
		if ((getMarkerPos (_x select 0)) distance (lhm_lastPosition select 1) < (_x select 1)) then {
			lhm_lastPosition = [];
		};
	} forEach blacklistedSpawnAreas;
};

lhm_lastPositionLoaded = true;
diag_log "::lhm Client:: Position loaded";