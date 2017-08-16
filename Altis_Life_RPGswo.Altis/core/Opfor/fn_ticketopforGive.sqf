/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {DWEV_ticketopfor_unit}) exitWith {hint "Diese Person ist nichts."};
if(isNull DWEV_ticketopfor_unit) exitWith {hint "Diese Person existiert nicht."};
_val = ctrlText 2752;
if(!([_val] call DWF_fnc_isnumber)) exitWith {hint "Du hast keine richtige Zahlen eingegeben."};
if((parseNumber _val) > 500000) exitWith {hint "Rechnungen können nicht höher als 50,000€ sein!"};
hint "Rechnung gestellt";
[player,(parseNumber _val)] remoteExec ["DWEV_fnc_ticketopforPrompt",DWEV_ticketopfor_unit];
closeDialog 0;