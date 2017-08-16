/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {DWEV_ticketme_unit}) exitWith {hint "Diese Person ist nichts."};
if(isNull DWEV_ticketme_unit) exitWith {hint "Diese Person existiert nicht."};
_val = ctrlText 2852;
if(!([_val] call DWF_fnc_isnumber)) exitWith {hint "Du hast keine richtige Zahlen eingegeben."};
if((parseNumber _val) > 200000) exitWith {hint "Quittungen können nicht höher als 200,000€ sein!"};
hint "Quittung gestellt";
[player,(parseNumber _val)] remoteExec ["DWEV_fnc_ticketmePrompt",DWEV_ticketme_unit];
closeDialog 0;