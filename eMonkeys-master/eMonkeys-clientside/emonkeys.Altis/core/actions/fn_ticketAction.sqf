/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "EMonkeys_ticket_give")) exitWith {hint "Couldn't open the ticketing interface"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format["Ticketing %1",_unit getVariable["realname",name _unit]]];
EMonkeys_ticket_unit = _unit;