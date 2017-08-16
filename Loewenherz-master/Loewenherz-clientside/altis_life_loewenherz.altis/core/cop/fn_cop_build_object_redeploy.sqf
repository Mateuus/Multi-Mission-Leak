/*
	File: fn_cop_classification_open.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de


	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/


private ["_object","_TEMPTEMP","_temp","_tempDir","_tempvar","_umgebung","_offset","_pos2","_dir","_oink"];
_object = cursorTarget;

if(!(_object getVariable["LHM_COP_BUILD",false])) exitWith {hint "Fehler 1337";};

LHM_COP_BUILD_OBJ = _object;
_TEMPTEMP = getposatl LHM_COP_BUILD_OBJ;
_temp = typeof LHM_COP_BUILD_OBJ;
_tempDir = getdir LHM_COP_BUILD_OBJ;
deleteVehicle LHM_COP_BUILD_OBJ;
LHM_COP_BUILD_OBJ = _temp createVehicleLocal [0,0,0];
_tempvar = LHM_COP_BUILD_OBJ;
LHM_COP_BUILD_OBJ setposatl _TEMPTEMP;
LHM_COP_BUILD_OBJ setdir _tempDir;

player addaction['<t color="#FF00FF">' + "Detach Object" + '</t>', {_id = _this select 2;_umgebung = nearestobjects[player,["Flag_Quontrol_F"],100]; if(count(_umgebung)== 0) exitWith {hint "Das kannst du hier nicht bauen, du musst in einem Radius von 100m um die Flagge bleiben";}; LHM_COP_BUILD_OBJ = objNull; player removeAction _id;}];

hint "Steuerung:\n Nach links rotieren: Q \n Nach rechts rotieren: E";

_offset = player worldToModel (getposATL LHM_COP_BUILD_OBJ);
COP_BUILD_X_OFFSET = _offset select 0;
COP_BUILD_Y_OFFSET = _offset select 1;
COP_BUILD_Z_OFFSET = _offset select 2;



while {!isnull LHM_COP_BUILD_OBJ} do {
	_pos2 = player modelToWorld[COP_BUILD_X_OFFSET, COP_BUILD_Y_OFFSET, COP_BUILD_Z_OFFSET];

	LHM_COP_BUILD_OBJ setPosATL _pos2;


sleep 0.1;
};

_dir = getdir _tempvar;
deleteVehicle _tempvar;

_oink = _temp createVehicle [0,0,0];
_oink setposatl [_pos2 select 0,_pos2 select 1,0];
_oink setdir _dir;
_oink setVariable["LHM_COP_BUILD",true,true];


