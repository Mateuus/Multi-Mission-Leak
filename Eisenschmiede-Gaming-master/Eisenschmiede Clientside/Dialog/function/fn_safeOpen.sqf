#include "..\script_macros.hpp"
/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
ES_safeObj = param [0,ObjNull,[ObjNull]];
if(isNull ES_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((ES_safeObj getVariable ["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((ES_safeObj getVariable ["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
if({side _x == west} count playableUnits < (ES_SETTINGS(getNumber,"cops_online_min"))) exitWith {
 	hint format [localize "STR_Civ_NotEnoughCops",(ES_SETTINGS(getNumber,"cops_online_min"))]
};
if(!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[ES_safeObj] call ES_fnc_safeInventory;
ES_safeObj setVariable ["inUse",true,true];
[ES_safeObj] spawn {
	waitUntil {isNull (findDisplay 3500)};
	SEL(_this,0) setVariable ["inUse",false,true];
};