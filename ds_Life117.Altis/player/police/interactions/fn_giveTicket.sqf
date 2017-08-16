/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Issues a ticket to your target
*/
private["_value","_reason"];

if(isNil {DS_cursorTarget}) exitWith {hint "You are not currently focused on any player"};
if(isNull DS_cursorTarget) exitWith {hint "You are not currently focused on any player"};
_value = ctrlText 1401;
_reason = ctrlText 1400;
if((_reason == "")||(_reason == "Enter ticket reason"))exitwith{hint "You must enter a reason"};
if(!([_value] call DS_fnc_isNumber)) exitWith {hint "Invalid input"};
if((parseNumber _value) > 999999) exitWith {hint "You can not issue a ticket of $1m or more"};
if((parseNumber _value) < 1) exitWith {hint "You can not issue a ticket of $0"};
if(playerside == west)then
	{
	[[0,format["Officer %1 has given %3 a ticket of $%2 for %4",profileName,[(parseNumber _value)] call DS_fnc_numberText,DS_cursorTarget getVariable["name",name DS_cursorTarget],_reason]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	}
	else
	{
	[[0,format["Security Contractor %1 has given %3 a ticket of $%2 for %4",profileName,[(parseNumber _value)] call DS_fnc_numberText,DS_cursorTarget getVariable["name",name DS_cursorTarget],_reason]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	};
[[player,(parseNumber _value),_reason],"DS_fnc_ticketPrompt",DS_cursorTarget,false] spawn BIS_fnc_MP;
