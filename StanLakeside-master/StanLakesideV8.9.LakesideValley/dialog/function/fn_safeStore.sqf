#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeStore.sqf
	

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;

//Error checks
if(!([_num] call fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat", false] spawn domsg;};
_num = parseNumber(_num);
if(_num < 1) exitWith {[localize "STR_Cop_VaultUnder1", false] spawn domsg;};
if(_ctrl != "goldbar") exitWith {[localize "STR_Cop_OnlyGold", false] spawn domsg;};
if(_num > life_inv_goldbar) exitWith {[format[localize "STR_Cop_NotEnoughGold",_num], false] spawn domsg;};

//Store it.
if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {[localize "STR_Cop_CantRemove", false] spawn domsg;};
_safeInfo = life_safeObj getVariable["safe",0];
life_safeObj setVariable["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;