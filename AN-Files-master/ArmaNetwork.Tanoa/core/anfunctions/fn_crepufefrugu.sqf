/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Verifies that the ticket was paid.
*/
params [
	["_value",5,[0]],
	["_unit",objNull,[objNull]],
	["_cop",objNull,[objNull]]
];
if(isNull _unit OR {_unit != life_ticket_unit}) exitWith {};
if(isNull _cop OR {_cop != player}) exitWith {};
[_value,1,0] call life_fnc_sewawruk;
