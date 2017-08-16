/*
	File: fn_copSiren.sqf
	Author: Chronic [MIT]

	Description:
	Adds a siren to a vehicle and offers several different modes
*/

private["_vehicle", "_cycle", "_changeMode", "_wailLength", "_yelpLength", "_phaserLength", "_hasSiren", "_sirenDual", "_sirenType", "_dualType", "_sirenDuration", "_dualDuration", "_sirenStart"];
_vehicle = _this select 0;		// the vehicle that the siren is on
_cycle = _this select 1;		// boolean of whether or not this call is for cycling the siren type
_changeMode = _this select 2;	// boolean of whether or not this call is for cycling the siren mode
_upstroke = _this select 3;

// only the driver can toggle the siren
if(driver _vehicle != player) exitWith {};

// these are the times to wait before looping each type of siren
_wailLength = 4.7;
_yelpLength = 6.36;
_phaserLength = 7.25;

if(isNull _vehicle) exitWith {};

// the vehicle's "sirenLogic" variable is a handle to the game object that plays the siren. We use a separate object so we can delete it and stop the sound mid-way
// if the siren has never been activated, initialize the vehicle's "sirenLogic" variable to a null object
if(isNil {_vehicle getVariable "sirenLogic"}) then {
	_vehicle setVariable ["sirenLogic", objNull, true];
};
// the vehicle's "sirenDual" variable specifies whether the siren is in mono or dual mode. In mono, both siren speakers play the same sound. In dual, they play the same sound out of phase or play two different sounds.
// if the siren has never been activated, initialize it to mono (false)
if(isNil {_vehicle getVariable "sirenDual"}) then {
	_vehicle setVariable ["sirenDual", false, true];
};
// the vehicle's "sirenType" variable specifies what kind of siren to play in the first speaker
// if the siren has never been activated, initialize it to the basic type
if(isNil {_vehicle getVariable "sirenType"}) then {
	_vehicle setVariable ["sirenType", "SirenWail", true];
};
// the vehicle's "dualType" variable specifies what kind of siren to play in the second speaker
// if the siren has never been activated, initialize it to the basic type
if(isNil {_vehicle getVariable "dualType"}) then {
	_vehicle setVariable ["dualType", "SirenWail", true];
};
// the vehicle's "sirenDuration" variable specifies how long to wait before looping the siren in the first speaker
// if the siren has never been activated, initialize it to the Wail length
if(isNil {_vehicle getVariable "sirenDuration"}) then {
	_vehicle setVariable ["sirenDuration", _wailLength, true];
};
// the vehicle's "dualDuration" variable specifies how long to wait before looping the siren in the second speaker
// if the siren has never been activated, initialize it to the Yelp length
if(isNil {_vehicle getVariable "dualDuration"}) then {
	_vehicle setVariable ["dualDuration", _wailLength, true];
};
// the vehicle's "sirenStart" variable specifies the time that the siren was started. Used for holding the F key down to chirp the siren.
// if the siren has never been activated, initialize it to null
if(isNil {_vehicle getVariable "sirenStart"}) then {
	_vehicle setVariable ["sirenStart", objNull, true];
};
// the vehicle's "forcedPhaser" variable specifies whether or not it should temporarily play the phaser sound
// if the lights have never been activated, initialize it to false
if(isNil {_vehicle getVariable "forcedPhaser"}) then {
	_vehicle setVariable ["forcedPhaser", false, true];
};
// the vehicle's "lights" variable specifies whether or not the emergency lights are activated
// if the lights have never been activated, initialize it to false
if(isNil {_vehicle getVariable "lights"}) then {
	_vehicle setVariable ["lights", false, true];
};

// the vehicle's "keyReleased" variable specifies whether or not the siren key has been released since it was activated
_vehicle setVariable ["keyReleased", _upstroke];

// pull some variables off the vehicle for easier use later
_hasSiren = !isNull(_vehicle getVariable "sirenLogic");
_sirenDual = _vehicle getVariable "sirenDual";
_sirenType = _vehicle getVariable "sirenType";
_dualType = _vehicle getVariable "dualType";
_sirenDuration = _vehicle getVariable "sirenDuration";
_dualDuration = _vehicle getVariable "dualDuration";
_sirenStart = _vehicle getVariable "sirenStart";
_forcedPhaser = _vehicle getVariable "forcedPhaser";

// this is for when the user just taps the F key (very short time between downstroke and upstroke), and determining what to do with the upstroke
if(_upstroke && !_cycle && !_changeMode) then {
	if(time - _sirenStart < 0.2 && time - _sirenStart > 0) then {
		//if the player just tapped the F key to toggle sirens on, then ignore this function when it's called on the upstroke
		if(!_forcedPhaser) then {
			breakTo "End";
		} else {
			// if they tapped it while the sirens were running (which would have enabled _forcedPhaser on the downstroke), then disable the _forcedPhaser and get ready to turn all sirens off
			_forcedPhaser = false;
			_vehicle setVariable ["forcedPhaser", false];
		};
	};
};

// if the vehicle already has a siren, delete it in preparation for the new one
if(_hasSiren) then {
	deleteVehicle (_vehicle getVariable "sirenLogic");
	_vehicle setVariable ["sirenLogic", objNull, true];
	_vehicle setVariable ["sirenStart", objNull, true];

	// if the siren is already going and this is a new downstroke of the F key, then we're forcing on the phaser sound
	if(!_upstroke) then {
		_vehicle setVariable ["forcedPhaser", true];
		_forcedPhaser = true;
	};
};

// cycle the siren type
if(_cycle) then {
	// _friendlyType is for the viewer-friendly message that we want to print to the screen
	_friendlyType = "";
	switch (_sirenType) do
	{
		case "SirenWail":
		{
			_sirenType = "SirenYelp";
			_dualType = "SirenWail";
			_sirenDuration = _yelpLength;
			_dualDuration = _wailLength;
			_friendlyType = "YELP";
		};
		case "SirenYelp":
		{
			_sirenType = "SirenWail";
			_dualType = "SirenWail";
			_sirenDuration = _wailLength;
			_dualDuration = _wailLength;
			_friendlyType = "WAIL";
		};
	};
	_vehicle setVariable ["sirenType", _sirenType, true];
	_vehicle setVariable ["sirenDuration", _sirenDuration, true];
	_vehicle setVariable ["dualType", _dualType, true];
	_vehicle setVariable ["dualDuration", _dualDuration, true];
	titleText [Format["Siren Type: %1", _friendlyType], "PLAIN"];
};

// change the siren mode
if(_changeMode) then {
	// _friendlyMode is for the viewer-friendly message that we want to print to the screen
	_friendlyMode = "";
	if(_sirenDual) then {
		// if it's in dual mode, set it to mono
		_sirenDual = false;
		_friendlyMode = "MONO";
	} else {
		// if it's in mono mode, set it to dual
		_sirenDual = true;
		_friendlyMode = "DUAL";
	};
	// set the new variable, and display the new mode to the user
	_vehicle setVariable ["sirenDual", _sirenDual, true];
	titleText [Format["Siren Mode: %1", _friendlyMode], "PLAIN"];
};

// if the vehicle has a siren already and we're not just changing the mode or temp playing the phaser sound, then we're turning it off. Tell the operator that.
if(_hasSiren && !_cycle && !_changeMode && !_forcedPhaser) then {
	titleText ["Siren Off", "PLAIN"];
};

// if any of these conditions are true: is a downstroke (only F key gives downstrokes), is an upstroke after using the forced phaser, or is an upstroke when the siren is already running and you're changing the type or mode, then we'll create new sirens
if(!_upstroke || (_upstroke && _forcedPhaser) || (_upstroke && _hasSiren && (_cycle || _changeMode))) then {

	// no matter what else happened, if it's an upstroke then we definately aren't forcing the phaser sound
	if(_upstroke) then {
		_forcedPhaser = false;
		_vehicle setVariable ["forcedPhaser", false];
	};

	// set the time that the siren started. This is for determining whether the user is just holding the key for a chirp, or is toggling it
	_vehicle setVariable ["sirenStart", time, true];

	// if the vehicle didn't already have a siren, then tell the operator we're creating a new one
	if(!_hasSiren) then {
		titleText ["Siren On", "PLAIN"];

		// turn on the cop lights when the sirens turn on. It would be really nice to not have to scroll wheel, because you always want lights on when you siren. Turning them off can be scroll-wheel action.
		if(!(_vehicle getVariable ["lights", false])) then {
			[_vehicle,"life_fnc_copLights",true,false] spawn life_fnc_MP;
		};
	};

	// why are we creating a cutter, you ask? Because we need the siren to play from an object that can be deleted when we want to stop it. Game Logic would be nicer, but it doesn't loop sound properly and doesn't work
	_sirenLogic = "Land_ClutterCutter_small_F" createVehicle ([0,0,0]);

	// tell all clients to initialize the quadbike properly and play the siren noise from it
	// if this is a forced phaser chirp, then play the phaser sound
	if(_forcedPhaser) then {
		[[_vehicle, _sirenLogic, "SirenPhaser", _phaserLength, false, player], "life_fnc_playCopSiren", true, false, false] call life_fnc_MP;
	} else {
		// otherwise, play your normal first siren sound
		[[_vehicle, _sirenLogic, _sirenType, _sirenDuration, false, player], "life_fnc_playCopSiren", true, false, false] call life_fnc_MP;

		// is the siren in dual mode?
		if(_vehicle getVariable "sirenDual") then {

			// if so, are both sirens set to the same type?
			_sameDual = (_veh getVariable "sirenType") == (_veh getVariable "dualType");

			// tell all clients to play the second siren noise
			[[_vehicle, _sirenLogic, _dualType, _dualDuration, _sameDual, player], "life_fnc_playCopSiren", true, false, false] call life_fnc_MP;
		};
	};

	// set the new siren-playing object as a variable in the vehicle
	_vehicle setVariable ["sirenLogic", _sirenLogic, true];
};
scopeName "End";