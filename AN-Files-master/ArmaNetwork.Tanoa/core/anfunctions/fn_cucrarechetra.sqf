#include <macro.h>

/*
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,ObjNull,[ObjNull]];
if(isNull life_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_safeObj getVariable ["safe",-1]) < 1) exitWith {hintSilent localize "STR_Civ_VaultEmpty";};
if((life_safeObj getVariable ["inUse",false]) && {((life_safeObj getVariable ["inUseBy",""]) != getPlayerUID player)}) then {
  _usedBy = (life_safeObj getVariable ["inUseBy",""]);
  if(_usedBy != "") then {
    _ready = {getPlayerUID _x isEqualTo _usedBy} count playableUnits;
    if(_ready > 0) exitWith {hintSilent "Someone's already looking at the safe!";};
  } else {
    life_safeObj setVariable["inUse",false,true];
  };
};
life_safeObj setVariable ["inUse",true,true];
life_safeObj setVariable ["inUseBy",(getPlayerUID player),true];
createDialog "nationalbank";
[life_safeObj] call life_fnc_jajewruzebucr;
[life_safeObj] spawn {
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable ["inUse",false,true];
	(_this select 0) setVariable ["inUseBy",nil,true];
	life_safeObj = nil;
};
