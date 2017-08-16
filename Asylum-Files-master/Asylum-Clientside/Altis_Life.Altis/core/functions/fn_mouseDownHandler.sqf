/*
	File: fn_mouseDownHandler.sqf
	Author: Chronic [MIT]

	Description:
	Main key handler for event 'mouseButtonDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

switch (_code) do {
	case 0:{
	// this action is for starting the airhorn sound on a vehicle when the left mouse button is clicked

		_vehicle = vehicle player;

		// only do it if it's a cop and he's the driver of a hunter or stryder
		if(!dialog && !visibleMap && playerSide == west && life_coplevel >= 5 && _vehicle != player && (driver _vehicle) == player && (typeof _vehicle == "B_MRAP_01_F" || typeof _vehicle == "I_MRAP_03_F")) then {

			// if this player's life_hornLogic variable hasn't been initialized yet, do it now
			if(isNil "life_hornLogic") then {
				life_hornLogic = objNull;
			};

			// if it's not, then let's create our own horn sound
			if(isNull life_hornLogic) then {

				// start by tearing out this vehicle's built-in horn
				_vehicle removeWeaponGlobal "TruckHorn2"; // hunter
				_vehicle removeWeaponGlobal "TruckHorn"; // strider
				life_hornLogic = "Land_ClutterCutter_small_F" createVehicle ([0,0,0]);
				life_hornLogic attachTo [_vehicle, [0,1,0]];
				life_hornLogic setVariable ["startTime", time, false];
				[[_vehicle, life_hornLogic], "life_fnc_airhorn", true, false, false] call life_fnc_MP;
				_handled = true;
			};
		};
	};
};

_handled