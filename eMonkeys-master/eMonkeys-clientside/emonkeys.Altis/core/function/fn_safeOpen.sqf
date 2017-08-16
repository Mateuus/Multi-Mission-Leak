/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
EMonkeys_safeObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull EMonkeys_safeObj) exitWith {};
if(!(side player in [east,civilian])) exitWith {};
if((EMonkeys_safeObj getVariable["safe",-1]) < 1) exitWith {hint "Der Safe ist leer!";};
if((EMonkeys_safeObj getVariable["inUse",false])) exitWith {hint "Jemand anderes greift gerade auf den Safe zu.."};
if(!createDialog "Federal_Safe") exitWith {"Der Dialog konnte nicht erstellt werden! Bitte wenden Sie sich an einen Administrator."};
disableSerialization;
ctrlSetText[3501,"Safe Inventory"];
[EMonkeys_safeObj] call EMonkeys_fnc_safeInventory;
EMonkeys_safeObj setVariable["inUse",true,true];
[EMonkeys_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};