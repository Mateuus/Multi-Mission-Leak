#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
	3.1.4.8 safeTake script
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;
if((life_safeObj getVariable ["inUse",false]) && {((life_safeObj getVariable ["inUseBy",""]) != getPlayerUID player)}) exitWith {closeDialog 0;hintSilent "Safe already being used!";};
if((lbCurSel 1500) isEqualTo -1) exitWith {hint "You need to select an item!";};
_ctrl = ctrlSelData(1500);
_num = ctrlText 1400;
_safeInfo = life_safeObj getVariable["safe",0];
//Error checks
if(!([_num] call life_fnc_spunetuwada)) exitWith {hintSilent "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hintSilent "You can't enter anything below 1!";};
if(_ctrl != "goldbar") exitWith {hintSilent "You can't take anything but gold bars from the safe."};
if(_num > _safeInfo) exitWith {hintSilent format["There isn't %1 gold bar(s) in the safe!",_num];};
//Take it
if(!([_ctrl,_num] call life_fnc_virtualItemAdd)) exitWith {hint "Couldn't add it to your inventory.";};
life_safeObj setVariable["safe",_safeInfo - _num,true];
[life_safeObj] call life_fnc_jajewruzebucr;
