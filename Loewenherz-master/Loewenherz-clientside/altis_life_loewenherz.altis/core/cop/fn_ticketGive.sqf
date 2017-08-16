/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {lhm_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull lhm_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 200000) exitWith {hint localize "STR_Cop_TicketOver100"};
[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call lhm_fnc_numberText,lhm_ticket_unit getVariable["realname",name lhm_ticket_unit]]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
[[player,(parseNumber _val)],"lhm_fnc_ticketPrompt",lhm_ticket_unit,false] call lhm_fnc_mp;
closeDialog 0;