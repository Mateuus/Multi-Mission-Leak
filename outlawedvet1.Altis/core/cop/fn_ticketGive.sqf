#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/
private["_val","_fine"];
_val = [_this,0,-1,[0]] call BIS_fnc_param;
if (isNil "life_ticket_unit") exitWith {hint localize "STR_Cop_TicketNil"};
if (isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};

switch (_val) do {
	//25k
	case 25: {
	_fine =25000;
	};
	//50k
	case 50: {
	_fine =50000;
	};
};
	

[0,"STR_Cop_TicketGive",true,[profileName,_fine call life_fnc_numberText,life_ticket_unit getVariable ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
[player,_fine] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;
