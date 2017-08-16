_veh = "I_Plane_Fighter_03_CAS_F" createVehicleLocal [0,0,0];
_veh allowDamage false;
_veh engineOn true;
_veh setPosATL [12495.2,10082.8,102.6426];
_veh setDir 272.491;
_veh setVelocity [-90,0,0];
life_veh = _veh;
_pilot = createGroup west createUnit ["I_pilot_F", [0,0,0], [], 0, "FORM"];
_pilot hideObjectGlobal true;
_pilot allowDamage false;
_pilot moveinDriver _veh;
_pilot setSpeedMode "FULL";
_pilot setskill 1;
removeAllWeapons _pilot;
removeAllItems _pilot;
removeUniform _pilot;
removeBackpack _pilot;
removeVest _pilot;
life_pilot = _pilot;
player addEventHandler["HandleDisconnect", {deleteVehicle life_veh;deleteVehicle life_pilot;}];
player allowDammage false;
player hideObjectGlobal true;
player attachTo [_veh, [-1, -5.4, -0.45] ];
player switchMove "Crew";
playSound "introJet";
[] spawn life_fnc_welcome;

showCinemaBorder true;
camUseNVG false;

_cam = "camera" camCreate [12135,10340.6,3.64053];
_cam cameraEffect ["internal","back"];
_cam camSetTarget vehicle player;
_cam camSetFOV 1.000;
_cam camCommit 0;
waitUntil { camCommitted _cam; };

_pilot doMove [10993.6,10212.2,107.174];

sleep 9;
titleText ["", "BLACK", 2];
sleep 2;
titleText ["", "PLAIN", 2];

_veh setPosATL [10090,11054.1,277.035];
_veh setDir 327.045;
_veh setVelocity [-90,90,0];
_pilot doMove [9379.64,12726.5,86.4649];

_cam camSetPos [10273,12125.9,264.98];
_cam camCommit 0;
waitUntil { camCommitted _cam; };

sleep 10;
titleText ["", "BLACK", 2];
sleep 2;
titleText ["", "PLAIN", 2];

_veh setPosATL [6205.84,10617.3,82.5517];
_veh setDir 223.636;
_veh setVelocity [-90,30,0];
_pilot doMove [5062.44,9734.56,181.322];

_cam camSetPos [5760.04,10446.1,62.6223];
_cam camCommit 0;
waitUntil { camCommitted _cam; };

sleep 15;
titleText ["", "BLACK", 2];
player hideObjectGlobal false;
sleep 2;
titleText ["", "PLAIN", 2];

player allowDammage false;
_veh setPosATL [-108.628,2981.68,108.579];
_veh setDir 73.6332;
_veh setVelocity [90,20,0];
_pilot doMove [2095.54,3459.47,0];
_veh action ["Land", _veh];

_cam camSetPos [1010.06,2883.7,34.5404];
_cam camCommit 0;
waitUntil { camCommitted _cam; };

sleep 12;
titleText ["", "BLACK", 2];
sleep 2;
titleText ["", "PLAIN", 2];

_cam cameraEffect ["terminate","back"];
camDestroy _cam;

waitUntil{player distance [2093.65,3465.16,0.00143909] < 10 OR (speed player) < 5};
detach player;
player setPos (getMarkerPos "civ_spawn_1");
player setDir (MarkerDir "civ_spawn_1");
player switchMove "";
deleteVehicle _veh;
deleteVehicle _pilot;
player removeEventHandler ["HandleDisconnect", 0];
[] spawn life_fnc_statusBar;
