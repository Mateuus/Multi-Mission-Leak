#include <macro.h>
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val","_isRpTicket"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_isRpTicket = [_this,0,false,[false]] call BIS_fnc_param;
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
//if((parseNumber _val) > 200000) exitWith {hint localize "STR_Cop_TicketOver100"};
[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit GVAR ["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] call life_fnc_MP;
[[player,(parseNumber _val),_isRpTicket],"life_fnc_ticketPrompt",life_ticket_unit,false] call life_fnc_MP;
closeDialog 0;