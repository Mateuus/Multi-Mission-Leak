/*---------------------------------------------------------------------------
	File: fn_ticketPrompt
	Author: Skrow & Skyfezzer
	
	Description:
	Prompts the player that he is being ticketed.
---------------------------------------------------------------------------*/

private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 3600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "adaclife_ticket_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 3600)};
_display = findDisplay 3600;
_control = _display displayCtrl 3601;
adaclife_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 demande %2€ pour la réparation!",_cop getVariable["realname",name _cop],_val];
player setvariable["adacanfrage",nil,true];
[] spawn
{
	disableSerialization;
	waitUntil {adaclife_ticket_paid OR (isNull (findDisplay 3600))};
	if(isNull (findDisplay 3600) && !adaclife_ticket_paid) then
	{
		[[0,format["%1 a refusé de payer la facture.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		[[1,format["%1 a refusé de payer la facture.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	};
};