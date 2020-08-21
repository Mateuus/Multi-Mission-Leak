#include "..\..\script_macros.hpp"

/*
	File: fn_loggedOut.sqf
	Author:

	Description:
	Logging out.
*/

[] call SOCK_fnc_updateRequest;

disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";

[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;
[] call life_fnc_hudUpdate;

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
_outroCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
_outroCam cameraEffect ["internal","back"];
_outroCam camSetFov 2.000;
_outroCam camSetTarget vehicle player;
_outroCam camSetRelPos [0,-1,1.85];
_outroCam camCommit 0;
waitUntil {camCommitted _outroCam};
_outroCam camSetFov 2;
_outroCam camSetRelPos [0,-5,1.85];
_outroCam camCommit 1;
8 cutFadeOut 3;
waitUntil {camCommitted _outroCam};
_outroCam camSetFov 9;
_outroCam camSetRelPos [0,-5,1050.85];
_outroCam camCommit 1.5;
waitUntil {camCommitted _outroCam};
cutText ["","BLACK",1];
sleep 1;
3 cutRsc ["SplashNoise","BLACK"];
sleep 0.25;

_name = name player;

[
    format[
    "<t size='1.3' color='#00C10D'>ALN dziękują za przybycie!</t><br/>Acid i Daktyl zaprasza ponownie %1 ! <br/><t size='1.1'>Gra Zapisana.</t>",_name],
    0,
    0.2,
    10,
    0,
    0,
    8
] spawn BIS_fnc_dynamicText;
sleep 4;
[0,"STR_NHS_PlayerDisconnected",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
[player] remoteExec ["TON_fnc_cleanupRequest",2];
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
failMission "Left";
_outroCam cameraEffect ["terminate","back"];
camDestroy _outroCam;