#include "..\..\macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "Du musst jemanden auswählen."};
if(isNil "_unit") exitWith {hint "Der ausgewählte Spieler ist nicht verfügbar."};
if(_val > 999999) exitWith {hint "Du kannst nicht mehr als 999,999€ überweisen";};
if(_val < 0) exitwith {};
if(!([str(_val)] call DWEV_fnc_isnumeric)) exitWith {hint "Das ist kein richtiges Zahlenformat."};
if(_val > dwf_atmcash) exitWith {hint "Du hast nicht soviel Geld auf deiner Bank."};
_tax = [_val] call DWEV_fnc_taxRate;
if((_val + _tax) > dwf_atmcash) exitWith {hint format["Du hast nicht soviel Geld auf deiner Bank. Um %1€ zu überweisen brauchst du %2€.",_val,_tax]};

dwf_atmcash = dwf_atmcash - (_val + _tax);

[_val,getMyDName] remoteExec ["DWF_fnc_clientWireTransfer",_unit];
[] call DWEV_fnc_atmMenu;
hint format["Du hast %1€ an %2 überwiesen.\n\nEine Steuergebühr von %3€ wurde erhoben und von deinem Bankkonto abgebucht.",[_val] call DWEV_fnc_numberText,getPlayerDName(_unit),[_tax] call DWEV_fnc_numberText];

if (isNil "DWEV_bank_transfer") then {DWEV_bank_transfer = false;};
if !(DWEV_bank_transfer) then 
{
	DWEV_bank_transfer = true;
	[] spawn
	{
		sleep 2;
		[1] call SOCK_fnc_updatePartial; 
		DWEV_bank_transfer = false;
	};
};