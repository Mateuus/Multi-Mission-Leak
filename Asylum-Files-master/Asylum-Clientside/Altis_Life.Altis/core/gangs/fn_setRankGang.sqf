/*
	File: fn_setRankGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initiates setting a gang member's rank up or down
*/
private["_dialog","_index","_members","_sel","_user","_promote","_rank","_active"];

_promote = [_this,0,false,[false]] call BIS_fnc_param;

disableSerialization;

_dialog = findDisplay 9620;
_members = _dialog displayCtrl 9621;
_sel = lbCurSel 9621;
_data = _members lbData _sel;
_data = call compile format["%1", _data];
_user = _data select 0;
_rank = _data select 1;

if (life_gang_rank >= _rank) exitWith {hint "You can only adjust rank of gang members below your own rank.";};

if (_promote) then { _rank = _rank - 1; }
else { _rank = _rank + 1; };

ctrlEnable [9622, false];
ctrlEnable [9624, false];
ctrlEnable [9625, false];
ctrlEnable [9630, false];

_active = objNull;
{
	if(getPlayerUID _x == _user) exitWith {_active = _x;};
} foreach allPlayers;

if (!isNull _active) then { [[player, _rank],"life_fnc_rankGang",_active,false] spawn life_fnc_MP; }
else { [[_user,life_gang,_rank],"ASY_fnc_gangMember",false,false] spawn life_fnc_MP; };

sleep 2;

[false] spawn life_fnc_gangManagement;