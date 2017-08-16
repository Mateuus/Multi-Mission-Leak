#include "..\..\script_macros.hpp"
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
 
	Description: Enables God mode for Admin
*/
if(FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;};
 
[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};
 
if(life_stealth) then {
        life_stealth = false;
        ["Stealth mode disabled",5,"blue"] call RPG_Fnc_Msg;
        [[player,false],"TON_fnc_hideObj",false,false] spawn BIS_fnc_MP;
} else {
        life_stealth = true;
        ["Stealth mode enabled",5,"blue"] call RPG_Fnc_Msg;
        [[player,true],"TON_fnc_hideObj",false,false] spawn BIS_fnc_MP;
};