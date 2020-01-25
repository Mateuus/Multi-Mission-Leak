#include "..\..\script_macros.hpp"
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Kajetan Kruk Mruk

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;


//Allowed zones in which database can be opened
_allowed = false;
_allowedZones = ["cop_spawn_1", "cop_spawn_2", "cop_spawn_3", "cop_spawn_4", "cop_spawn_5"];
_allowedCars = [];
{
	if((player distance (getMarkerPos _x)) < 50) exitWith {_allowed = true;}
} forEach _allowedZones;
{
	if(vehicle player == _x) exitWith {_allowed = true;}
} forEach _allowedCars;
if(!_allowed) exitWith {};



createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = CONTROL(2400,2407);
lbClear _list2; //Purge the list


_crimes = LIFE_SETTINGS(getArray,"crimes");

{
	_list2 lbAdd format["%1 - $%2 (%3)",localize (_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;

ctrlSetText[2404,"Establishing connection..."];

if(FETCH_CONST(life_coplevel) < 3 && FETCH_CONST(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[player] remoteExec ["life_fnc_wantedFetch",RSERV];
