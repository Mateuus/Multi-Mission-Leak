#include "..\..\script_macros.hpp"
private["_test","_uiDisp","_time","_timer"];
if(vest player != "V_HarnessOGL_gry") exitWith {};
if(life_suicide) exitWith {};

life_suicide = true;

[player] remoteExec ["life_fnc_beepSound",RCLIENT];

disableSerialization;
6 cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (15);

while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];

[player] remoteExec ["life_fnc_allahSound",RCLIENT];

sleep 1.5;

if(vest player != "V_HarnessOGL_gry") exitWith {};
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];

removeVest player;

if(alive player) then {player setDamage 1;};

[0,"STR_NOTF_Suicide",true,[profileName, player getVariable ["realname",name player]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

life_suicide = false;