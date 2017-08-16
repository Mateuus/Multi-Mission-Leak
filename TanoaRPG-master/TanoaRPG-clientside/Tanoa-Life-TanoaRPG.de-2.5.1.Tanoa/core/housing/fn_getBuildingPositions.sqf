/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
	
	Edited:
	By CooliMC for Apex
	Restricted are now only used positions
*/
private["_building","_arr","_allowed","_exitLoop","_i"];
_building = _this select 0;
_arr = [];

_allowed = switch(typeOf _building) do
{
	case "Land_House_Small_02_F": {[5,6]};
	case "Land_House_Small_03_F": {[4,8]};
	case "Land_House_Small_04_F": {[5]};
	case "Land_House_small_05_F": {[1]};
	case "Land_House_Small_06_F": {[1]};
	case "Land_GarageShelter_01_F": {[5]};
	case "Land_Slum_01_F": {[6,7]};
	case "Land_House_Big_01_F": {[0,8]};
	case "Land_House_Big_02_F": {[4,8]};
	case "Land_House_Big_04_F": {[4,16]};
	case "Land_Addon_04_F": {[0,2]};
	case "Land_Slum_03_F": {[12,17,18]};
	case "Land_School_01_F": {[1,3,9,11,15]};
	case "Land_Hotel_02_F": {[0,5,14,16,23,24,25,29]};
	default {[9999]};
};

if(9999 in _allowed) then
{
	_i = 0;
	_exitLoop = false;
	while {!_exitLoop} do
	{
		_pos = _building buildingPos _i;
		if(_pos isEqualTo [0,0,0]) then
		{
			_exitLoop = true;
		} else {
			_arr pushBack _pos;
		};
		_i = _i + 1;
	};
} else {
	{
		_pos = _building buildingPos _x;
		if(_pos isEqualTo [0,0,0]) then
		{
			diag_log "Fehler in der House Configuration";
		} else {
			_arr pushBack _pos;
		};
	} forEach _allowed;
};

_arr;
