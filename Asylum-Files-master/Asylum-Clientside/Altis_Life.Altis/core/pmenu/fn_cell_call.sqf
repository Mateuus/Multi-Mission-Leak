/*
	File: fn_cell_call.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Opens the cell call/phone menu
*/
private["_display","_units","_type","_allPlayers","_playableSorted","_name","_status"];

disableSerialization;
waitUntil {!isNull findDisplay 5000};

[] call life_fnc_p_updateMenu;

_display = findDisplay 5000;
_units = _display displayCtrl 5004;
_statusLabel = _display displayCtrl 5003;
_status = "Idle";
switch (life_phone_status) do
{
	case 1: { _status = "Ringing" };
	case 2: { _status = "Calling" };
	case 3: { _status = "On Call" };
};
_statusLabel ctrlSetStructuredText parseText _status;
lbClear _units;

[] spawn
{
	while {!isNull findDisplay 5000} do
	{
		sleep 1;
		ctrlEnable [5004, (life_phone_status == 0)];
		ctrlEnable [5015, (life_phone_status == 0)];
		ctrlEnable [5016, (life_phone_status != 0)];
	};
};

_units lbAdd "911 Emergency";
_units lbSetData [(lbSize _units)-1,"911"];

_allPlayers = [];
{
	if ((side _x) != east) then { _allPlayers set [count _allPlayers, name _x]; };
} foreach allPlayers;
_playableSorted = _allPlayers call BIS_fnc_sortAlphabetically;
{
	_name = _x;
	{
		if (name _x == _name && alive _x && _x != player) then
		{
			_units lbAdd format["%1",name _x];
			_units lbSetData [(lbSize _units)-1,str(_x)];
		};
	} foreach allPlayers;
} foreach _playableSorted;

lbSetCurSel [5004,0];