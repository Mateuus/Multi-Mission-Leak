/*
	File: fn_cop_classification_organize.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de

	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/




private ["_display","_lBOX","_map","_sel","_data","_obj","_dis","_pos","_rnd","_y"];
disableSerialization;

if(isnull(findDisplay 5488)) exitWith {};

_display = findDisplay 5488;
_lBOX = _display displayCtrl 1500;
_map = _display displayctrl 38502;
_sel = lbcursel _lBOX;

if(_sel == -1) exitWith {};

_data = _lBOX lbdata _sel;

if(_data isEqualTo "") exitWith {};

_obj = objectfromnetid _data;

if(isnull _obj) exitWith {hint "Die Position des Fahrzeugs konnte nicht bestimmt werden";};

_dis = _obj distance vehicle player;

if(_dis > 2000) exitWith {hint "Die Position des Fahrzeugs konnte nicht bestimmt werden";};

_pos = getpos _obj;

_rnd = random(100);
if(_rnd > 50) then {
	_x = [_pos select 0,(_pos select 0) + floor(random (1000))] call BIS_fnc_randomInt;
	_pos set[0,_x];
} else {
	_x = [_pos select 0,(_pos select 0) - floor(random (1000))] call BIS_fnc_randomInt;
	_pos set[0,_x];

};

_rnd = random(100);
if(_rnd > 50) then {
	_y = [_pos select 1,(_pos select 1) + floor(random (1000))] call BIS_fnc_randomInt;
	_pos set[1,_y];
} else {
	_y = [_pos select 1,(_pos select 1) - floor(random (1000))] call BIS_fnc_randomInt;
	_pos set[1,_y];

};


[_map,1,0.1,_pos] call lhm_fnc_setMapPosition;

