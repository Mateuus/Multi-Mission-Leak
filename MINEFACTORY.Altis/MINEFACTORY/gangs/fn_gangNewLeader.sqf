#include "..\..\script_macros.hpp"
/*
	File: fn_gangNewLeader.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if(EQUAL((lbCurSel 2621),-1)) exitWith {hint  "Du musst erst eine Person auswählen!"};
_unit = call compile format["%1",CONTROL_DATA(2621)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint  "Du bist bereits der Anführer!"};

_action = [
	format[ "Du bist dabei, die Führung an %1 zu übertragen<br/>Durch die Übertragung der Leitung der Gang hast du keine Kontrolle mehr.",_unit GVAR ["realname",name _unit]],
	 "Gangleitung übertragen",
	 "Ja",
	 "Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(EQUAL(_unitID,"")) exitWith {hint "Bad UID?"}; //Unlikely?
	grpPlayer SVAR ["gang_owner",_unitID,true];
	grpPlayer selectLeader _unit;
	[_unit,grpPlayer] remoteExec ["TON_fnc_clientGangLeader",_unit]; //Boot that bitch!
	
	if(life_HC_isActive) then {
		[3,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
	} else {
		[3,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
	};
	
} else {
	hint  "Übertragung der Leitung abgebrochen.";
};
[] call life_fnc_gangMenu;