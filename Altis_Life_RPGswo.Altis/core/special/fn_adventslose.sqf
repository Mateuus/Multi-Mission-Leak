/*
	File: fn_adventslose.sqf
	Author: Sandmann | Division-Wolf.de
	
	Description:
	Ticket verkauf
*/

private["_preis", "_anzahl"];
_anzahl = param [0,"",[""]];
if(! ([_anzahl] call DWF_fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};
_anzahl = parseNumber _anzahl; //requested number

_preis = 2500;
if(player getVariable["noobschutz",false]) then {
	_preis = 2500;
} else {
	_preis = 20000;
}; 
_preis = _preis * _anzahl;
if(dwf_cash < _preis) exitWith { hint format["Du hast keine %1 € dabei.", _preis]; };

//if(isNil "DWEV_ticket_inUse") then {DWEV_ticket_inUse = time-1801;};
//if(DWEV_ticket_inUse+(1800) >= time) exitWith {hint format["Du kannst nur alle zwei Minuten ein Adventslos kaufen, nächstes in %1:%2",29 - floor ((time - DWEV_ticket_inUse) / 60),59 - round (time - DWEV_ticket_inUse - (floor ((time - DWEV_ticket_inUse) / 60)) * 60)];};

hint format["Du hast dir %2 Adventslose für %1€ gekauft, und nimmst an der Verlosung teil.", _preis, _anzahl];



dwf_cash = dwf_cash - _preis;

[player, _anzahl] remoteExec ["DB_fnc_adventslose",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

[0] call SOCK_fnc_updatePartial;

//DWEV_ticket_inUse = time;