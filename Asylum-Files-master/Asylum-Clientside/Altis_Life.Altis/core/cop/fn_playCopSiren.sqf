/*
	File: fn_playAdvancedCopSiren.sqf
	Author: Chronic

	Description:
	Plays a siren sound from the given object
*/

private ["_sirenLogic", "_vehicle", "_sirenType", "_sirenDuration", "_sameDual", "_local"];

_vehicle = _this select 0;
_sirenLogic = _this select 1;
_sirenType = _this select 2;
_sirenDuration = _this select 3;
_sameDual = _this select 4;
_local = (_this select 5) == player;
if(["MRAP",typeOf _vehicle] call BIS_fnc_inString) then {_sirenType = "siren2"};
// turn off damage and simulation on the object playing the siren (because it's a quadbike and we don't want it to collide or blow up)
_sirenLogic allowDamage false;
_sirenLogic enableSimulation false;

// hide the object so no one can see it
hideObject _sirenLogic;

// if this is running on the computer of the person who turned on the siren, then attach it to that vehicle
if(_local) then {
	_sirenLogic attachTo [_vehicle, [0,1,0]];
};

// if it's in dual mode and it's the same siren type, then play them out of phase
if(_sameDual) then {
	sleep 0.8;
};

// loop the siren
// exit if the vehicle or siren object gets deleted, if the driver gets out of the vehicle, or if the vehicle gets blown up
while{!isNull _vehicle && !isNull _sirenLogic && !isNull(driver _vehicle) && alive _vehicle} do {

	// play the siren sound!
	_sirenLogic say3D _sirenType;

	// sleep for the duration of the siren sound
	sleep _sirenDuration;
};

// if this is running on the computer of the person who turned on the siren, then delete it once it's done
if(_local) then {
	deleteVehicle _sirenLogic;
	_vehicle setVariable ["_sirenLogic", objNull];
};
