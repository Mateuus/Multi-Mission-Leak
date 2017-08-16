disableSerialization;
disableUserInput true;
showChat false;
hint "";
2 cutFadeOut 1;
3 cutFadeout 1;
playsound "shutdown";

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
4 cutRsc ["SplashNoise","BLACK"];
sleep 0.25; 

[
	format[
	"<t size='1.3' color='#00C10D'>Bis bald bei Secrets of Altis!</t><br/>%1<br/><t size='1.1'>Daten wurden gespeichert.</t>",name player],
	0,
	0.2,
	4,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

sleep 4;
disableUserInput false;
['bye',false,true] call BIS_fnc_endMission;
_outroCam cameraEffect ["terminate","back"];
camDestroy _outroCam;