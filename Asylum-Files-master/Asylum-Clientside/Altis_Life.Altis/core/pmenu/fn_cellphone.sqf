/*
	File: fn_cellphone.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type","_allPlayers","_playableSorted","_name"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};

[] call life_fnc_p_updateMenu;

_display = findDisplay 3000;
_units = _display displayCtrl 3004;

ctrlSetText [3003, ""];
lbClear _units;

if((life_adminlevel < 1)) then
{
	ctrlShow[3022,false];
	if ((getPlayerUID player) == (life_configuration select 0)) then
	{
		ctrlShow[3021,true];
		ctrlSetText[3021, "Gov Msg All"];
	}
	else
	{
		ctrlShow[3021,false];
	};
};
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

lbSetCurSel [3004,0];