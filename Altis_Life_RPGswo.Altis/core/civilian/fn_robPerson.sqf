#include "..\..\macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = param [0,ObjNull,[ObjNull]];
if(isNull _robber) exitWith {}; //No one to return it to?
if (player getVariable["noobschutz",false]) exitWith {};

if(dwf_cash > 0) then
{
	_tmp_cash = dwf_cash;
	dwf_cash = 0;
	[0] call SOCK_fnc_updatePartial;
	
	[_tmp_cash] remoteExec ["DWEV_fnc_robReceive",_robber];
	if (_tmp_cash >= 500000) then 
	{
		[15,_robber,format ["Spieler %1 hat von Spieler %2 (%3) %4€ gestohlen.",getPlayerDName(_robber),getMyDName,getPlayerUID player,[_tmp_cash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
	[getPlayerUID _robber,getPlayerName(_robber),"211"] remoteExec ["DWEV_fnc_wantedAdd",2];
	format["%1 hat %2 um %3€ erleichtert.",getPlayerDName(_robber),getMyDName,[_tmp_cash] call DWEV_fnc_numberText] remoteExec ["hint",-2];
}
	else
{
	format["%1 Hat kein Geld bei sich.",getMyDName] remoteExec ["hint",_robber];
};