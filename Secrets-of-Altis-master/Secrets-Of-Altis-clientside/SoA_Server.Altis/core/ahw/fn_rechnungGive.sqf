/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_rechnung_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_rechnung_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call SOA_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 200000) exitWith {hint localize "STR_Cop_TicketOver100"};
[0,"STR_Adac_RechnungGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_rechnung_unit getVariable["realname",name life_rechnung_unit]]] remoteExecCall ["life_fnc_broadcast",independent];
[player,(parseNumber _val)] remoteExec ["life_fnc_rechnungPrompt",life_rechnung_unit];
closeDialog 0;