#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	
	
	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {[localize "STR_Civ_SelectItem", false] spawn domsg;};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable["safe",0];

//Error checks
if(!([_num] call fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat", false] spawn domsg;};
_num = parseNumber(_num);
if(_num < 1) exitWith {[localize "STR_Cop_VaultUnder1", false] spawn domsg;};
if(_ctrl != "goldbar") exitWith {[localize "STR_Cop_OnlyGold", false] spawn domsg;};
if(_num > _safeInfo) exitWith {[format[localize "STR_Civ_IsntEnoughGold",_num], false] spawn domsg;};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {[localize "STR_NOTF_InvFull", false] spawn domsg;};


//Take it
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {[localize "STR_NOTF_CouldntAdd", false] spawn domsg;};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;