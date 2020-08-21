#include "..\..\script_macros.hpp"
/*
	File: fn_payParkingTicket.sqf

	Description:
	Pay parking ticket.
*/
private["_veh"];
_veh = cursorTarget;
_parkingTicket = LIFE_SETTINGS(getNumber,"parking_ticket");
if(BANK < _parkingTicket) exitWith {};

if(_veh GVAR ["parkingTicket", false]) then {
	_veh SVAR ["parkingTicket",false,true];
	titleText["Zapłaciłeś mandat w wysokości $10,000 za nieprawidłowe parkowanie.","PLAIN DOWN"];
	SUB(BANK,_parkingTicket);
};

[] call SOCK_fnc_updateRequest;