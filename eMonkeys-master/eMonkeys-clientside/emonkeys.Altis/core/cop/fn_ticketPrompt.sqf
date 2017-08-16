/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "EMonkeys_ticket_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
EMonkeys_ticket_paid = false;
EMonkeys_ticket_val = _val;
EMonkeys_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 gab dir ein Bußgeld von %2€",_cop getVariable["realname",name _cop],_val];

[] spawn
{
	disableSerialization;
	waitUntil {EMonkeys_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !EMonkeys_ticket_paid) then
	{
		[[0,format["%1 weigert sich das Bußgeld zu bezahlen.",profileName]],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;
		[[1,format["%1 weigert sich das Bußgeld zu bezahlen.",profileName]],"EMonkeys_fnc_broadcast",EMonkeys_ticket_cop,false] call EMonkeys_fnc_mp;
	};
};