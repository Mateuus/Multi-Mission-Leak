/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
private["_value","_unit","_cop"];
_value = param [0,5,[0]];
_unit = param [1,ObjNull,[ObjNull]];
_cop = param [2,ObjNull,[ObjNull]];
_Tax = ((100 - CopTaxValue) / 100);
if(isNull _unit OR {_unit != DWEV_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO


if (_value >= 100) then
{
	dwf_cash = dwf_cash + (_value * _Tax);
	[player,(_value * (1 - _Tax)),"Ticket"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
}
else
{
	dwf_cash = dwf_cash + _value;
};

[6] call SOCK_fnc_updatePartial;