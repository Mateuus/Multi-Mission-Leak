#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "Du musst erst jemanden auswählen!"};
_data = call compile format["%1",getSelData(2621)]; // // [""76561197989745324"",""[MS-13] Forty Vogel"",0]
_members = grpPlayer getVariable ["gang_members",[]];
_uid = (_data select 0);
_name = (_data select 1);
_isOnline = [_uid] call DWEV_fnc_isUIDActive;
_gang_id = grpPlayer getVariable ["gang_id",[]];

if(_uid == steamid) exitWith {hint "Du bist schon der Leader!"};

_action = [
	format["Du bist dabei %1 die Führung zu übergeben.<br/>Durch die übertragung hast du nicht mehr die Kontrolle über die Gang, es sei denn Sie wird dir zurück gegeben.",_name],
	"Gang Leader übergeben",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	grpPlayer setVariable["gang_owner",_uid,true];
	
	if (_isOnline) then 
	{
		_unit = objNull;
		
		{
			if ((getPlayerUID _x) == _uid) exitWith {_unit = _x};
		
			false;
		} count playableUnits;

		{
			if (_uid IN _x) exitWith 
			{
				_x set [2,6]; // Auf COLONEL setzen
			};
		
			false;
		} count _members;
		
		if (!isNull _unit) then 
		{
			grpPlayer selectLeader _unit;
			[_unit,grpPlayer] remoteExec ["DWF_fnc_clientGangLeader",_unit];
		};
	};
	
	
	[_gang_id,_uid] remoteExec ["DWF_fnc_updateGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	hint format ["Du hast %1 zum Leader deiner Gang erklärt",_name];
}
else 
{
	hint "Gang übergabe abgebrochen.";
};
[] call DWEV_fnc_gangMenu;