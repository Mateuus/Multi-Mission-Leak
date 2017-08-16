#include <macro.h>
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
[[0,format["%1 est parti se coucher",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[LIFE_ID_PlayerTags,"onEachFrame"] spawn BIS_fnc_removeStackedEventHandler;
1 fadeSound 0;
1 fadeSpeech 0;

[] call SOCK_fnc_updateRequest;
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
    "<t size='1' color='#00C10D'><br/><br/>Synchronisation avec le serveur</t><br/>Le staff d'AltisNewLife espère vous revoir bientôt %1 !<br/><br/><t size='0.6'>— Vos données ont été synchronisées et votre inventaire sauvegardé —</t>",_name],
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
[[player],"TON_fnc_cleanupRequest",false,false] spawn life_fnc_MP;
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
failMission "Left";
_outroCam cameraEffect ["terminate","back"];
camDestroy _outroCam;
["Aborted",true,false] spawn BIS_fnc_endMission;
endMission "Abort";