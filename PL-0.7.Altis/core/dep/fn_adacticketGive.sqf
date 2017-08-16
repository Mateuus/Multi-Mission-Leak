/*---------------------------------------------------------------------------
	File: fn_adacTicketGive.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	Gives a ticket to the targeted player.
---------------------------------------------------------------------------*/

private["_val"];
if(isNil {adaclife_ticket_unit}) exitWith {hint "Il n'y a personne à qui donner la facture"};
if(isNull adaclife_ticket_unit) exitWith {hint "La personne à qui donner la facture n'existe pas."};
_val = ctrlText 3652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "Vous ne pouvez entrer que des chiffres."};
if((parseNumber _val) > 100000) exitWith {hint "La facture ne doit pas être plus de 100 000€."};
[[0,format["%1 à demandé %2€ d'acompte à %3 pour une réparation.",profileName,[(parseNumber _val)] call life_fnc_numberText,adaclife_ticket_unit getVariable["realname",name adaclife_ticket_unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_adacticketPrompt",adaclife_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;