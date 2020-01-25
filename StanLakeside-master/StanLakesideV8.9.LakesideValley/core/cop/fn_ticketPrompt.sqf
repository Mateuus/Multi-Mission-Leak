/*
	File: fn_ticketPrompt
	
	
	Description:
	Prompts the player that he is being ticketed.
*/

params ["_cop", "_val", "_display", "_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
if(isNull _cop) exitWith {};

createDialog "life_ticket_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),_cop getVariable["realname",name _cop],_val];

[] spawn
{
	disableSerialization;
	waitUntil {life_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !life_ticket_paid) then
	{
		[0,format[localize "STR_Cop_Ticket_Refuse",profileName]] remoteExecCall ["life_fnc_broadcast", west];
		[1,format[localize "STR_Cop_Ticket_Refuse",profileName]] remoteExecCall ["life_fnc_broadcast", -2];
	};
};