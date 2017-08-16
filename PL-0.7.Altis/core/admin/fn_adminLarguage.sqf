#include "..\..\script_macros.hpp"
/*
	File: fn_adminLarguage.sqf
	Author: Skrow #ProjetLife
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
if(!_action) exitWith {closeDialog 0; hint "Il y a du avoir un bug";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

_action = createDialog "life_larguage";
if(_action) then {
	[[getPosWorld player],"TON_fnc_generateAirdrop",false,false] spawn life_fnc_MP;
	player say3D "largage";
	closeDialog 0;
};