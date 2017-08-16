/*
Filename: fn_cop_build_dialog_update.sqf

Author: Barney

Description: No Description for u!

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_display","_LB_Objects","_Combo_sides","_was","_config","_foreachindex"];
if(!(playerside in [west,east])) exitWith {hint "Du bist kein Cop oder Sec!";};
disableSerialization;

_display 	 = findDisplay 2222;
//Listboxes
_LB_Objects 	 = _display displayCtrl 2302;
_Combo_sides 	 = _display displayCtrl 2304;
if(lbcursel _Combo_sides == -1) exitWith {hint "Du hast Nichts ausgewählt!";};

_was = _Combo_sides lbdata (lbCurSel _Combo_sides);

_config = [_was] call lhm_fnc_cop_build_dialog_config;
lbClear _LB_Objects;


{
	_LB_Objects lbadd (getText(configFile >> "CfgVehicles" >> _x >> "displayName"));
	_LB_Objects lbSetData[_foreachindex,_x];
} foreach _config;

