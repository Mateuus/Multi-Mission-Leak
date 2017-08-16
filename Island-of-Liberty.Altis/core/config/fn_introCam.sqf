execVM "scripts\intro\intro.sqf";
private ["_camera", "_camDistance","_randCamY","_randCamZ","_camTime"];
_camDistance = 700;
_randCamY = 75 - floor(random 150);
_randCamZ = 75 - floor(random 150);

playsound "Intro";

_onScreenTime = 4;

_role1 = "Wusstest du schon";
_role1names = ["Wir haben unseren eigenen Launcher, Downloade ihn auf unserer Website oder im Forum"];
{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='1.00' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
} forEach [
[_role1, _role1names]
];

_camTime = 15;
_camera = "camera" camCreate [3290.04-_camDistance,13380,-25];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget [3290.04,13380,10];
_camera camSetRelPos [0,0,0];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

_onScreenTime = 3;

_role1 = "Besucht uns:";
_role1names = ["WWW.Island-of-Liberty.com"];
{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='1.0' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
} forEach [
[_role1, _role1names]
];

_camTime = 7;
_camera = "camera" camCreate [3611.73,12980,30];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget [3611.73,13080,25];//13080
_camera camSetRelPos [0,0,0];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

_role1 = "Teamspeak:";
_role1names = ["TS.Island-of-Liberty.com"];
{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='1.0' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names]
];

_camTime = 7;
_camera = "camera" camCreate [20788.2,6733.6,2];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget [20802.4,6783.28,2];
_camera camSetRelPos [0,0,0];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

_role1 = "Registrier dich doch bei uns:";
_role1names = ["Island-of-Liberty.com/forum"];
{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='1.0' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names]
];

_camTime = 7;
_camera = "camera" camCreate [7947.11,16008.9,2];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget [8143.12,15900.4,2];
_camera camSetRelPos [0,0,0];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

_role1 = "";
_role1names = ["Island of Liberty wünscht dir Viel Spass"];
{
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='1.0' color='#FFFFFF' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names]
];

_camTime = 4;
_camera = "camera" camCreate [(position player select 0), (position player select 1),(position player select 2)+500];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

/*format["Welcome %1, We have car-mods on this server. Enjoy and have fun!:",profileName] hintC
[
	"Read All Rules , modpack available on website!"
];*/
[] spawn life_fnc_autoMessages;
[] execVM "scripts\intro\willkommen_iol.sqf";

life_firstSpawn = false;
life_tagson = true;