#include "..\..\script_macros.hpp"
[] call SOCK_fnc_updateRequest;
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;
life_einwanderung = false;

[0,format["Spieler %1 ging in die Lobby",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];

_introCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
_introCam cameraEffect ["internal","back"];
_introCam camSetFov 2.000;
_introCam camSetTarget vehicle player;
_introCam camSetRelPos [0,-1,1.85];

_introCam camCommit 0;
waitUntil {camCommitted _introCam};

_introCam camSetFov 2;
_introCam camSetRelPos [0,-5,1.85];
_introCam camCommit 1;
8 cutFadeOut 3;
waitUntil {camCommitted _introCam};

_introCam camSetFov 9;
_introCam camSetRelPos [0,-5,1050.85];
_introCam camCommit 1.5;
waitUntil {camCommitted _introCam};

cutText ["","BLACK",1];
sleep 1; 
sleep 0.25;

_name = name player;

[
	format[
	"<t size='1.3' color='#5600FF'>Auf Wiedersehen!</t><br/>Besuche uns wieder %1. <br/><t size='1.1'>MineFactory Altis Life</t>",_name],
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;


if(!life_is_arrested) then {
	player setPos (getMarkerPos "respawn_civilian");
};
sleep 4;
0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;
[player] remoteExec ["TON_fnc_cleanupRequest",2];
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;

["Aborted",true,false] spawn BIS_fnc_endMission;
