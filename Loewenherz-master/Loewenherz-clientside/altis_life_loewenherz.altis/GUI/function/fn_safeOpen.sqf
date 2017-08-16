/*
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
lhm_safeObj = param [0,ObjNull,[ObjNull]];
//if(Bankheiststate != 8) exitWith {hint "Fehler: Banküberfall wurde nicht gestartet!"};
if(isNull lhm_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((lhm_safeObj getVariable["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((lhm_safeObj getVariable["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
//if({side _x == west} count playableUnits < 8) exitWith {hint localize "STR_Civ_NotEnoughCops"};
if(!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[lhm_safeObj] call lhm_fnc_safeInventory;
lhm_safeObj setVariable["inUse",true,true];
[lhm_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};