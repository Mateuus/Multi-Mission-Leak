/*
	File: fn_safeInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Fills up the safes inventory.
*/
private["_safe","_tInv","_pInv","_safeInfo","_str","_shrt","_smuggler"];
_safe = param [0,ObjNull,[ObjNull]];
if(isNull _safe) exitWith {closeDialog 0;};
disableSerialization;
//_smuggler = _this select 1;
_tInv = (findDisplay 3500) displayCtrl 3502;
lbClear _tInv;
_safeInfo = _safe getVariable["heligold",-1];
if(_safeInfo < 1) exitWith {closeDialog 0; hint localize "STR_Civ_VaultEmpty";};

_str = [randomSmug] call life_fnc_varToStr;
_shrt = [randomSmug,1] call life_fnc_varHandle;
_tInv lbAdd format["[%1] - %2",_safeInfo,_str];
_tInv lbSetData [(lbSize _tInv)-1,_shrt];