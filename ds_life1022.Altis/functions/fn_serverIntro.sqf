/*
    Darkside Life

	Author:

	Description:
	Plays an intro for the player
*/

private ["_camera"];

if(isServer)then{DS_realEstateArray set [26,1];};
if((DS_realEstateArray select 26) == 1)exitWith{[] execVM "scripts\welcome.sqf";};

player allowDamage false;

if((playerSide isEqualTo west)||(player getVariable ["security", false]))then {
    playSound "introSongCop";
} else {
    playSound "introSongCiv";
};

["<t color='#286FDA' font='PuristaSemiBold' shadow='2' size='2'>Welcome to The Darkside<br/></t>
  <t color='#FFFFFF' font='PuristaSemiBold' shadow='2' size='1'>www.thedarksidegames.com<br/></t>
  <t color='#FFFFFF' font='PuristaSemiBold' shadow='2' size='0.7'>ts.thedarksidegames.com:10004</t>",-1,-1,7,3,0] spawn BIS_fnc_dynamicText;

_camera = "camera" camCreate [(getPos player select 0)+(random 3000),(getPos player select 1)+(random 4000),(getPos player select 2)+1000];
_camera cameraEffect ["Internal","BACK"];
_camera camSetFOV 2;
showCinemaBorder true;
camUseNVG false;
_camera camCommit 0;

waitUntil {camCommitted _camera};

_camera camSetTarget (vehicle player);
_camera camSetRelPos [0,0,2];
_camera camCommit 6;

waitUntil {camCommitted _camera};

_camera cameraEffect ["Terminate","BACK"];
camDestroy _camera;

player allowDamage true;

[] execVM "scripts\welcome.sqf";