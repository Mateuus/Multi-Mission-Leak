/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "life_rechnung_give")) exitWith {hint "Fehlerlie"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format["ADAC-Rechnungsbeleg",_unit getVariable["realname",name _unit]]];
life_rechnung_unit = _unit;