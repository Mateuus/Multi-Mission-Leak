/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the gold inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_goldObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_goldObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_goldObj getVariable["gold",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((life_goldObj getVariable["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
if(!createDialog "Gold_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_goldObj] call life_fnc_safeInvGold;
life_goldObj setVariable["inUse",true,true];
[life_goldObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};