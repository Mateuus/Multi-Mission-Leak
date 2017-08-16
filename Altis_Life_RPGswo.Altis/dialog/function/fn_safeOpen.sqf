/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
DWEV_safeObj = param [0,ObjNull,[ObjNull]];
if(isNull DWEV_safeObj) exitWith {};
if((side player) != civilian) exitWith {};
if((DWEV_safeObj getVariable["safe",-1]) < 1) exitWith {hint "Der Safe ist leer!";};
if((DWEV_safeObj getVariable["inUse",false])) exitWith {hint "Jemand anderes ist schon am Safe.."};
//if({side _x == west} count playableUnits < 6) exitWith {hint "Es müssen 6 oder mehr Polizisten online sein, um weitermachen zu können."};
if ({(_x getVariable["coplevel",0]) > 1} count playableUnits < 8 ) exitWith {hint "Es muessen min. 8 Wachmeister oder h�her online sein."};
if ({(_x getVariable["coplevel",0]) > 5} count playableUnits < 3 ) exitWith {hint "Es muessen min. 3 Kommissar oder h�her online sein."};
if(!createDialog "Federal_Safe") exitWith {"Dialog konnte nicht geöffnet werden, melde es bitte."};
disableSerialization;
ctrlSetText[3501,"Safe Inventory"];
[DWEV_safeObj] call DWEV_fnc_safeInventory;
DWEV_safeObj setVariable["inUse",true,true];
[DWEV_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};