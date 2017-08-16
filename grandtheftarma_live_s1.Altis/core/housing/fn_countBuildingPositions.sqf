/*
	File: fn_countuildingPositions.sqf
	Author: Mario2002
	
	Description:
	Counts the building positions of a building
	
	@return Number
*/

private["_house", "_i"];

_house = [_this,0] call GTA_fnc_param;
_i = 0;

while {((typeName (_house buildingPos _i) == "ARRAY") && (((_house buildingPos _i) select 0) != 0) || (((_house buildingPos _i) select 1) != 0))} do {
	//diag_log format ["Building POS : %1", (_house buildingPos _i)];
	_i = _i + 1;
};

_i;