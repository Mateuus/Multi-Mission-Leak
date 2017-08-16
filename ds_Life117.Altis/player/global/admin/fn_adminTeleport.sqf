/*
	File: fn_adminTeleport.sqf
	Author: ColinM9991
	Credits: To original script author(s)
	Description:
	Teleport to chosen position.
*/
private["_unit","_player","_action"];

if(DS_adminlevel < 4) exitWith {closeDialog 0};
if((getPlayerUID player) in DS_adminlist4)then
	{
	_player = (name player);
	[] spawn {
	  while {dialog} do {
	   closeDialog 0;
	   sleep 0.01;
	  };
	};
	tele={
		_pos = [_this select 0, _this select 1, _this select 2];
		(vehicle player) setpos [_pos select 0, _pos select 1, 0];
		onMapSingleClick "";
		openMap [false, false];
		hint "You have teleported to your selected position";
	};
	openMap [true, false];
	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";
	[[_player,"Teleport"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	};