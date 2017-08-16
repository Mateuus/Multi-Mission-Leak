/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {EMonkeys_ticket_unit}) exitWith {hint "Person to ticket is nil"};
if(isNull EMonkeys_ticket_unit) exitWith {hint "Person to ticket doesn't exist."};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) exitWith {hint "Sie haben keinen tatsächlichen Zahlenformat"};
if((parseNumber _val) > 300000) exitWith {hint "Bußgelder über 300.000€ können nicht anders behandelt werden!"};
[[0,format["%1 gab %3 ein Bußgeld in Höhe von %2€",profileName,[(parseNumber _val)] call EMonkeys_fnc_numberText,EMonkeys_ticket_unit getVariable["realname",name EMonkeys_ticket_unit]]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;
[[player,(parseNumber _val)],"EMonkeys_fnc_ticketPrompt",EMonkeys_ticket_unit,false] call EMonkeys_fnc_mp;
closeDialog 0;