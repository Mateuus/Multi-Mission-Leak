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
if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if(_ctrl != "goldbar") exitWith {hint localize "STR_Cop_OnlyGold"};
if(_num > lhm_inv_goldbar) exitWith {hint format[localize "STR_Cop_NotEnoughGold",_num];};

//Store it.
if(!([false,_ctrl,_num] call lhm_fnc_handleInv)) exitWith {hint localize "STR_Cop_CantRemove";};
_safeInfo = lhm_safeObj getVariable["safe",0];
lhm_safeObj setVariable["safe",_safeInfo + _num,true];

[lhm_safeObj] call lhm_fnc_safeInventory;