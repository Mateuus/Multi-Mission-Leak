/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the gold inventory menu.
*/
if(dialog) exitWith {};
life_heliGoldObj = param [0,ObjNull,[ObjNull]];
if(isNull life_heliGoldObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_heliGoldObj getVariable["heligold",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((life_heliGoldObj getVariable["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
if(!createDialog "heligold_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_heliGoldObj] call life_fnc_safeInvHeliGold;
life_heliGoldObj setVariable["inUse",true,true];
[life_heliGoldObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};