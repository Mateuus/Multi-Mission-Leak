/*
	File: fn_safeInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Fills up the safes inventory.
*/
private["_safe","_tInv","_pInv","_safeInfo","_str","_shrt"];
_safe = param [0,ObjNull,[ObjNull]];
if(isNull _safe) exitWith {closeDialog 0;};
if((life_safeObj getVariable["inUseBy",""]) != getPlayerUID player) exitWith {closeDialog 0; hintSilent "Someone's already looking at the safe!";};
disableSerialization;
_tInv = (findDisplay 3500) displayCtrl 1500;
lbClear _tInv;
_safeInfo = _safe getVariable["safe",-1];
if(_safeInfo < 1) exitWith {closeDialog 0; hintSilent localize "STR_Civ_VaultEmpty";};
_str = getText(missionConfigFile >> "VirtualItems" >> "goldbar" >> "displayName");
_shrt = getText(missionConfigFile >> "VirtualItems" >> "goldbar" >> "variable");
_tInv lbAdd format["[%1] - %2",_safeInfo,(localize _str)];
_tInv lbSetData [(lbSize _tInv)-1,_shrt];
