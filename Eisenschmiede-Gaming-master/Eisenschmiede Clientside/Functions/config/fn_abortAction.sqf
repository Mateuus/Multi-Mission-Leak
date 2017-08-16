#include "../script_macros.hpp"
if(FETCH_CONST(ES_adminlevel) >= 5) exitWith {closeDialog 0; [] call SOCK_fnc_updateRequest; [player] remoteExec ["ES_fnc_cleanupRequest",-2]; ["Abort",true,false] call BIS_fnc_endMission; };


playSound "Out";

2 cutFadeOut 0.5;
3 cutFadeOut 0.5;

[] call SOCK_fnc_updateRequest;

[player] remoteExec ["ES_fnc_cleanupRequest",-2];

disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
// [ES_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;

1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;
[] spawn ES_fnc_hudUpdate;


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
/*
_effectID = 1 + floor random 3;
_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
_video = [ _videoFile ] spawn BIS_fnc_playVideo;
playSound ( "Transition" + str _effectID );
*/
sleep 1;

_name = name player;
[format["<t size='1.3' color='#ff9900'>Auf Wiedersehen!</t><br/>Wir hoffen du besuchst uns erneut<br/> %1 <br/><br/><t size='1.1'>www.Eisenschmiede-Gaming.de</t>",_name],
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

if(!ES_is_arrested) then {
	player setPos (getMarkerPos "abort");
};
sleep 6;
0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
["Abort",true,false] spawn BIS_fnc_endMission;
_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;