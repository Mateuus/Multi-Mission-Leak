#include "..\script_macros.hpp"
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = (lbData[3503,(lbCurSel 3503)]);
_num = ctrlText 3506;

//Error checks
if(!([_num] call ES_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if(!(EQUAL(_ctrl,"goldbar"))) exitWith {hint localize "STR_Cop_OnlyGold"};
if(_num > ES_inv_goldbar) exitWith {hint format[localize "STR_Cop_NotEnoughGold",_num];};

//Store it.
if(!([false,_ctrl,_num] call ES_fnc_handleInv)) exitWith {hint localize "STR_Cop_CantRemove";};
_safeInfo = ES_safeObj getVariable["safe",0];
ES_safeObj getVariable ["safe",_safeInfo + _num,true];

[ES_safeObj] call ES_fnc_safeInventory;