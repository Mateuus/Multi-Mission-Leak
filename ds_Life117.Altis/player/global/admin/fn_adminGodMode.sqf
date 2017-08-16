/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
 
	Description: Enables God mode for Admin
*/

private["_unit","_player","_action"];

_player = (name player);

if(DS_adminlevel < 4) exitWith {closeDialog 0};
if((getPlayerUID player) in DS_adminlist4)then
	{
	[] spawn {
	  while {dialog} do {
	   closeDialog 0;
	   sleep 0.01;
	  };
	};
 
	if(DS_god) then {
		DS_god = false;
		titleText ["God mode disabled","PLAIN"]; titleFadeOut 2;
		player setVariable ["bulletProof",false,true];
		[[_player,"Disabled God Mode"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	} else {
		DS_god = true;
		titleText ["God mode enabled","PLAIN"]; titleFadeOut 2;
		player setVariable ["bulletProof",true,true];
		[[_player,"Activated God Mode"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	}; 
};