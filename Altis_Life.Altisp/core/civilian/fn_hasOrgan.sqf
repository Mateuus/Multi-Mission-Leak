#include "..\..\script_macros.hpp"
/*
	file: fn_hasOrgan.sqf
	author: [midgetgrimm] - www.grimmlife.com

*/
private["_organThief"];
_organThief = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _organThief) exitWith {};

[0,format["%1 has cut a kidney out of %2.",name _organThief,name player]] remoteExec ["life_fnc_broadcast",RCLIENT];
[_organThief,"kidney",1] call life_fnc_handleInv;
[getPlayerUID _organThief,name _organThief,"919",_organThief] remoteExec ["life_fnc_wantedAdd",RSERV];
sleep 300;
_organThief setVariable["hasOrgan",false,true];
