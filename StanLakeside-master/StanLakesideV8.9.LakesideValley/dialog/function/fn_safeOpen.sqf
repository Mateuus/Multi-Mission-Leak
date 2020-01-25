/*	
	File: fn_safeOpen.sqf
	
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,ObjNull,[ObjNull]];
if(isNull life_safeObj) exitWith {};
if(playerSide != civilian || playerSide != east) exitWith {};
if((life_safeObj getVariable["safe",-1]) < 1) exitWith {[localize "STR_Civ_VaultEmpty", false] spawn domsg;};
if((life_safeObj getVariable["inUse",false])) exitWith {[localize "STR_Civ_VaultInUse", false] spawn domsg;};
if({side _x == west} count playableUnits < 5) exitWith {[localize "STR_Civ_NotEnoughCops", false] spawn domsg;};
if(!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call life_fnc_safeInventory;
life_safeObj setVariable["inUse",true,true];
[life_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};