scriptName "fn_start";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_start.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_start.sqf"

if (isNil "mav_tuning_lastVisit") then {
	mav_tuning_lastVisit = -999;
};

if (vehicle player == player) exitWith {hint "You have to be in a vehicle"};
if (driver vehicle player != player) exitWith {hint "You're not the driver of the vehicle!"};
if ((count crew vehicle player) > 1) exitWith {hint "You have to be alone in the vehicle!"};
if (isNil {(vehicle player) getVariable "vehicleID"}) exitWith {hint "The vehicle has to be stored in a garage first before it can be tuned!"};
if (diag_tickTime - mav_tuning_lastVisit < 10) exitWith {hint "You are already visiting the tuning shop!"};

// Var
_veh = vehicle player;

// Last Visit
mav_tuning_lastVisit = diag_tickTime;

// Master CFG
_configName = [typeOf _veh] call mav_tuning_fnc_getMasterConfig;

// Not tuneable?
if (_configName == "") exitWith {hint "This vehicle cannot be tuned"};

// Input
disableUserInput true;

// Transition
5000 cutRsc ["maverick_dialog_tuning_leaveentertransition","PLAIN"];
sleep 4;

if ((count crew vehicle player) > 1) exitWith {
	hint "You have to be alone in the vehicle!";
	disableUserInput false;
};

// Enable input
disableUserInput false;

// Make vehicle not visible for players and hide all other players, enable godmode
[vehicle player] remoteExec ["mav_tuning_fnc_hide",2];
waitUntil {isObjectHidden (vehicle player)};
(vehicle player) allowDamage false;

// Hide all other vehicles
{
	_x hideObject true;
} forEach vehicles;

// Make veh visible only to us
_veh hideObject false;

// Default values
if (isNil {_veh getVariable "mav_tuning"}) then {
	[_veh] call mav_tuning_fnc_applyDefaults;
};

// Stop vehicle
_veh setVelocity [0, 0, 0];

// Turn lights on and engine off
player action ["lightOn", _veh];
player action ["engineOff", _veh];

// Hide hints and chat
showChat false;
hint "";

// Set veh to coordinates and stuff
_camPos = getArray(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Camera" >> "pos");
_camTarget = getArray(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Camera" >> "target");
_vehPos = getArray(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Vehicle" >> "pos");
_vehDir = getNumber(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Vehicle" >> "dir");
_buildingName = getText(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Building" >> "type");
_buildingPos = getArray(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Building" >> "pos");
_buildingDir = getNumber(missionConfigFile >> "Maverick_Tuning" >> worldName >> "Building" >> "dir");

mav_tuning_object = "camera" camCreate (getPos player);
mav_tuning_object cameraEffect ["Internal", "Back"];
mav_tuning_object camSetFOV .65;
mav_tuning_object camSetFocus [2, 1];
mav_tuning_object camSetPos _camPos;
mav_tuning_object camSetTarget _camTarget;
mav_tuning_object camCommit 0;

_building = _buildingName createVehicleLocal _buildingPos;
_building setPosATL _buildingPos;
_building setDir _buildingDir;
mav_tuning_building = _building;

mav_tuning_nightlight = "#lightpoint" createVehicleLocal [0,0,0];
mav_tuning_nightlight setLightColor [250,250,250];
mav_tuning_nightlight setLightAmbient [1,1,1];
mav_tuning_nightlight setLightAttenuation [1,1,1,0];
mav_tuning_nightlight setLightIntensity 10;
mav_tuning_nightlight setLightUseFlare true;
mav_tuning_nightlight setLightFlareSize 0.2;
mav_tuning_nightlight setLightFlareMaxDistance 50;
mav_tuning_nightlight setPosATL _camPos;

mav_tuning_originalPosition = getPos _veh;

_veh setPosATL _vehPos;
_veh setDir _vehDir;


// Sleep
sleep 4;

// Transition done, open dialog
waitUntil {createDialog "mav_tuning_dialog_main"};

// Handlers
(findDisplay 5100) displayAddEventHandler ["KeyDown",{
	_handled = false;
	if ((_this select 1) == 1) then {
		_handled = true; // Block ESC
	};
	if ((_this select 1) == 28) then {
		[] spawn mav_tuning_fnc_purchaseSelectedModification;
		_handled = true;
	};
	_handled;
}];
((findDisplay 5100) displayCtrl 0) ctrlAddEventHandler ["LBSelChanged",{
	_this spawn mav_tuning_fnc_loadPreview;
}];
((findDisplay 5100) displayCtrl 0) ctrlAddEventHandler ["LBDblClick",{
	[] spawn mav_tuning_fnc_purchaseSelectedModification;
}];
((findDisplay 5100) displayCtrl 1) ctrlAddEventHandler ["ButtonClick",{
	[] spawn mav_tuning_fnc_exit;
}];

// Load data according to vehicle type
[typeOf (vehicle player)] spawn mav_tuning_fnc_mainMenuForType;