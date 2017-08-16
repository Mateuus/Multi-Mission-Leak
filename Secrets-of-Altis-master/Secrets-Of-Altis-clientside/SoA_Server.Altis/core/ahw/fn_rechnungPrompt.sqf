/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_adac","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_adac = _this select 0;
if(isNull _adac) exitWith {};
_val = _this select 1;

createDialog "life_rechnung_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
life_rechnung_paid = false;
life_rechnung_val = _val;
life_rechnung_adac = _adac;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +(localize "STR_Adac_Rechnung_GUI_Given"),_adac getVariable["realname",name _adac],_val];

[] spawn
{
	disableSerialization;
	waitUntil {life_rechnung_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !life_rechnung_paid) then
	{
		[0,"STR_Adac_Rechnung_Refuse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",independent];
		[1,"STR_Adac_Rechnung_Refuse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_rechnung_adac];
	};
};