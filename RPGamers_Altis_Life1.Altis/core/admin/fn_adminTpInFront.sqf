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
 
if (isNil "admin_tpdirection_0n") then {admin_tpdirection_0n = true;} else {admin_tpdirection_0n = !admin_tpdirection_0n;};
		//sleep 0.01;
		if (admin_tpdirection_0n) then 
		{
			["Don't forget god mode, or you will probably die",5,"gray"] call RPG_Fnc_Msg;
			cutText ["TP infront of you ON - Press 6 to tp forward - Press 7 to Fly", "PLAIN DOWN"];
		}
		else
		{
			//hint "TP infront of you OFF";
			cutText ["TP infront of you OFF", "PLAIN DOWN"];
		};