#include "..\..\script_macros.hpp"
/*
    File: fn_cellphone.sqf
    Author: Alan
	---> Edited by Basti | John Collins <---

    Description:
    Opens the cellphone menu?
*/
private ["_display","_units","_type"];
if((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]))exitWith{closeDialog 0; hint "Das kannst du jetzt nicht benutzen!";};
disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;
_spieler = [];

ctrlSetText [3003, ""];
lbClear _units;

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[3020,false];
    ctrlShow[3021,false];
};
{_spieler pushback _x}foreach playableUnits;
_sorted = [_spieler,[],{_x},"ASCEND"] call BIS_fnc_sortBy;
_units lbAdd "An die Polizei";
_units lbSetData [(lbSize _units)-1,"west"];
_units lbSetColor [(lbSize _units)-1, [0.259,0.655,0.957, 0.5]];
_units lbAdd "An die Feuerwehr";
_units lbSetData [(lbSize _units)-1,"independent"];
_units lbSetColor [(lbSize _units)-1, [0, 1, 0, 0.5]];
_units lbAdd "An die Admins";
_units lbSetData [(lbSize _units)-1,"anadmin"];
_units lbSetColor [(lbSize _units)-1, [1, 0, 0, 0.5]];
if((call life_adminlevel) > 1) then {
	_units lbAdd "Admin an Alle Spieler";
	_units lbSetData [(lbSize _units)-1,"analleadmin"];
	_units lbSetColor [(lbSize _units)-1, [1, 0, 0, 0.5]];
};
if((call life_coplevel) > 4) then {
	_units lbAdd "Polizeimeldung";
	_units lbSetData [(lbSize _units)-1,"copmeldung"];
	_units lbSetColor [(lbSize _units)-1, [0.259,0.655,0.957, 0.5]];
};
if((call life_mediclevel) > 4) then {
	_units lbAdd "Feuerwehr-Meldung";
	_units lbSetData [(lbSize _units)-1,"emsmeldung"];
	_units lbSetColor [(lbSize _units)-1, [0, 1, 0, 0.5]];
};
_units lbAdd "=========================";
_units lbSetData [(lbSize _units)-1,"strich"];
{
    if (alive _x && _x != player) then {
        switch (side _x) do {
            case west: {_type = "Polizei"};
            case civilian: {_type = "Zivilist"};
            case independent: {_type = "Feuerwehr"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach _sorted;

lbSetCurSel [3004,0];
[2] call ESG_fnc_oldmsg;