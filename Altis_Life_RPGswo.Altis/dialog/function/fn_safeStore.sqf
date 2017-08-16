#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;

//Error checks
if(!([_num] call DWF_fnc_isnumber)) exitWith {hint "Kein richtiges Zahlenformat.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du musst min. einen reinlegen.";};
if(_ctrl != "goldbar") exitWith {hint "Du kannst nichts anderes als Bankgold reinlegen."};
if(_num > DWEV_inv_goldbar) exitWith {hint format["Du hast keine %1 Bankgold",_num];};

//Store it.
if(!([false,_ctrl,_num] call DWEV_fnc_handlelnv)) exitWith {hint "Konnte es nicht aus deinem Inventar in den Safe legen.";};
_safeInfo = DWEV_safeObj getVariable["safe",0];
DWEV_safeObj setVariable["safe",_safeInfo + _num,true];

[DWEV_safeObj] call DWEV_fnc_safeInventory;