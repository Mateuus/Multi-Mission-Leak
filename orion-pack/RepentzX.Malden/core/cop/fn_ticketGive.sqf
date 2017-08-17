#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/
if (isNil "life_ticket_unit") exitWith {[localize "STR_Cop_TicketNil",true,"slow"] call life_fnc_notificationSystem;};
if (isNull life_ticket_unit) exitWith {[localize "STR_Cop_TicketExist",true,"slow"] call life_fnc_notificationSystem;};

private _val = ctrlText 2652;

if (!([_val] call TON_fnc_isnumber)) exitWith {[localize "STR_Cop_TicketNum",true,"slow"] call life_fnc_notificationSystem;};
if ((parseNumber _val) > 200000) exitWith {[localize "STR_Cop_TicketOver100",true,"slow"] call life_fnc_notificationSystem;};

[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;
