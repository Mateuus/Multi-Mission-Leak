#include "..\..\macros.hpp"
/*
	file: fn_hasOrgan.sqf
	author: [midgetgrimm]
	
*/
private["_organThief"];
_case = param [0,1,[0]];
_organThief = param [1,ObjNull,[ObjNull]];
if(isNull _organThief) exitWith {};

switch (_case) do
{
	case 0: // TakeOrgans
	{
	[0,_organThief,format ["%1 hat %2 (%3) eine Niere rausgeschnitten.",getPlayerDName(_organThief),getMyDName,getPlayerUID player]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	
	format["%1 hat %2 eine Niere rausgeschnitten.",getPlayerDName(_organThief),getMyDName] remoteExec ["hint",-2];	
	[_organThief,"kidney",1] call DWEV_fnc_handlelnv;

	[getPlayerUID _organThief,getPlayerName(_organThief),"501"] remoteExec ["DWEV_fnc_wantedAdd",2];
	sleep 600;
	_organThief setVariable["hasOrgan",false,true];
	};
	
	case 1: // GiveOrgans
	{
//	player setVariable["missingOrgan",false,true]; //wird nicht benötigt weil schon in take drin steht?
	DWEV_thirst = 100;
	DWEV_hunger = 100;
	player setFatigue .5;
	[getPlayerUID player,0, side player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen
	format["%1 hat dir eine Niere eingesetzt.",getPlayerDName(_organThief)] remoteExec ["hint",player];
	format["Du hast %1 eine Niere eingesetzt.",getMyDName] remoteExec ["hint",_organThief];	
	};
};