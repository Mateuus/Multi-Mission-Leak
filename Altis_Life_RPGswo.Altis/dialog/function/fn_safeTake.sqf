#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint "Du musst ein Gegenstand auswählen!";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = DWEV_safeObj getVariable["safe",0];

//Error checks
if(!([_num] call DWF_fnc_isnumber)) exitWith {hint "Kein richtiges Zahlenformat.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du musst min. einen nehmen!";};
if(_ctrl != "goldbar") exitWith {hint "Du kannst nur Bankgold in den Safe legen."};
if(_num > _safeInfo) exitWith {hint format["Es sind keine %1 Bankgold im Safe!",_num];};

//Secondary checks
_num = [_ctrl,_num,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Dein Inventar ist voll."};


//Take it
if(!([true,_ctrl,_num] call DWEV_fnc_handlelnv)) exitWith {hint "Konnte es nicht in dein Inventar legen.";};
DWEV_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[DWEV_safeObj] call DWEV_fnc_safeInventory;