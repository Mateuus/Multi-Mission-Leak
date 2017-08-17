#include "..\..\script_macros.hpp"
params [
	["_prisonvaultVariables", objNull, [objNull]]
];
private ["_uiDisp","_time","_timer"];
disableSerialization;
"lifeTimer" cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (60 * 7);
remoteExec ['life_fnc_AAN_Jail',-2];
for "_i" from 0 to 1 step 0 do {
    if (isNull _uiDisp) then {
		hint "h";
        "lifeTimer" cutRsc ["life_timer","PLAIN"];
        _uiDisp = uiNamespace getVariable "life_timer";
        _timer = _uiDisp displayCtrl 38301;
    };
    if (round(_time - time) < 1) exitWith {
		//hint "time error";
	};
    if (!(_prisonvaultVariables getVariable ["pchargeplaced",false])) exitWith {
		//hint "i did";
	};
    _timer ctrlSetText format ["Jail Break: %1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
    sleep 0.08;
};
"lifeTimer" cutText["","PLAIN"];

