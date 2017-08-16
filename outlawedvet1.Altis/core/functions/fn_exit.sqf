/*
	@Author: Panda
	@File Name: fn_exit.sqf
	@Edited by: RPGforYOU
*/
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hint "";
[] call SOCK_fnc_updateRequest;
uiSleep 1;
player setPos (getMarkerPos "spawn_island");
500 cutFadeOut 0;
1 fadeSound 0;
1 fadeSpeech 0;
/*
if (playerSide isEqualTo west) then {
{deleteVehicle _x;} forEach (life_placeables_placed);
};
*/
[player] remoteExec ["TON_fnc_cleanupRequest",2];
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
_outroCam camCommit 1;
waitUntil {camCommitted _outroCam};
cutText ["","BLACK",1];
uiSleep 0.5;
["exit", false, true] call BIS_fnc_endMission;
_outroCam cameraEffect ["terminate","back"];
camDestroy _outroCam;
