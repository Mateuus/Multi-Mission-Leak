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
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};
if(_ctrl != "goldbar") exitWith {hint "You can't store anything but gold bars in the safe."};
if(_num > EMonkeys_inv_goldbar) exitWith {hint format["You don't have %1 gold bar(s)",_num];};

//Store it.
if(!([false,_ctrl,_num] call EMonkeys_fnc_handleInv)) exitWith {hint "Couldn't remove the item(s) from your inventory to put in the safe.";};
_safeInfo = EMonkeys_safeObj getVariable["safe",0];
EMonkeys_safeObj setVariable["safe",_safeInfo + _num,true];

[EMonkeys_safeObj] call EMonkeys_fnc_safeInventory;