#include "..\..\macros.hpp"
/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total","_funds"];
_val = param [0,"",["",0]];
_total = param [1,"",["",0]];

if (_val == _total) then
{
	_bountyend = (_val); //_bountyend = (_val/2);
	dwf_atmcash = ((dwf_atmcash + dwf_cash) - 100);
	dwf_cash = 100;
	
	if(dwf_atmcash < _bountyend) then 
	{
		_funds = grpPlayer getVariable ["gang_bank",0];
		
		if (_funds > _bountyend) then
		{
			titleText ["Du hattes nicht genug Geld um die Gefaengnisstrafe zu zahlen. Daher wurde es von deinem Gangkonto abgebucht.","PLAIN"];
			
			[grpPlayer,_bountyend] remoteExec ["DWF_fnc_gangBankWithdraw",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		}
		else
		{
			titleText ["Du hattes nicht genug Geld um die Gefaengnisstrafe zu zahlen. Daher wurde dein vermoegen auf 1000€ gesetzt.","PLAIN"];
			dwf_atmcash = 1000;
		};
	}
	else
	{
		dwf_atmcash = (dwf_atmcash - _bountyend);	
		titleText[format["Dir wurde dein Bussgeld %1€ vom Konto abgebucht. Geld was du auf der Hand hattes wurde vorher auf dein Konto eingezahlt.",[_bountyend] call DWEV_fnc_numberText],"PLAIN"];
	}
};

[6] call SOCK_fnc_updatePartial;