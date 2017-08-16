#include "..\script_macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val"];
if(!isNull (findDisplay 2600)) exitWith {}; //Already at the ticket menu, block for abuse?
_cop = SEL(_this,0);
if(isNull _cop) exitWith {};
_val = SEL(_this,1);

createDialog "ES_ticket_pay";
disableSerialization;
waitUntil {!isNull (findDisplay 2600)};

ES_ticket_paid = false;
ES_ticket_val = _val;
ES_ticket_cop = _cop;
CONTROL(2600,2601) ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),_cop getVariable ["realname",name _cop],_val];

[] spawn {
	disableSerialization;
	waitUntil {ES_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !ES_ticket_paid) then {
		[0,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExec ["ES_fnc_broadcast",west];
		[1,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExec ["ES_fnc_broadcast",ES_ticket_cop];
	};
};