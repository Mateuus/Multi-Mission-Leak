#include "..\..\script_macros.hpp"
/*
	File: fn_gangCreated.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private "_group";
life_action_gangInUse = nil;

if(BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
	hint format[ "Du hast nicht genug Geld auf deinem Bankkonto.\n\nDir fehlen: $%1",[((LIFE_SETTINGS(getNumber,"gang_price"))-BANK)] call life_fnc_numberText];
	{grpPlayer SVAR [_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

SUB(BANK,(LIFE_SETTINGS(getNumber,"gang_price")));

hint format[ "Du hast die Gang %1 für $%2 erstellt",(group player) getVariable "gang_name",[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText];