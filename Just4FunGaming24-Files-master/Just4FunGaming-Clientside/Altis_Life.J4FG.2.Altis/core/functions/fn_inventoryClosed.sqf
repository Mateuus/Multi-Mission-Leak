/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container"];

_container = [ _this, 1, objNull, [objNull] ] call BIS_fnc_param;

if(isNull _container) exitWith {};

if( (typeOf _container) isEqualTo "B_supplyCrate_F" ) exitWith {
	_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5, 0.5]];
	
	switch(true) do {
		case (count _house == 0): {_exit = true;};
		case (count _house == 1): {_house = _house select 0;};
		default {
			{if(_x isKindOf "House_F") exitWith {_house = _x;};} forEach _house;
		};
	};
	if( !isNil "_exit" || !(_house isKindOf "House_F") ) exitWith {
        hint localize "STR_House_ContainerError";
    };
	[_house] remoteExec ["XYDB_fnc_updateHouseContainers", XYDB];
};