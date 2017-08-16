/*
	File: fn_copLights.sqf
	Author: Chronic [MIT]

	Description:
	Adds the light effect to cop vehicles
*/

private ["_vehicle", "_ownerCopLevel", "_offroad", "_SUV", "_hatchback", "_hunter", "_strider", "_hummingbird", "_huron","_hellcat","_orca","_ghosthawk","_lightRed", "_lightBlue", "_lightBrightRed", "_lightBrightBlue", "_lightHighBrightness", "_lightLowBrightness", "_lightAttenuation", "_lightIntensity", "_lightFlareSize", "_lightFlareMaxDistance", "_numStrobes", "_strobeTimeOn", "_strobeTimeOff","_offsetMultiplier","_advancedLights", "_extraLights"];

_vehicle = _this;
if(_vehicle getVariable ["lights", false]) exitWith {}; // lights are already on, don't do it again

_vehicle setVariable ["lights", true, false]; // set the vehicle's lights variable locally

// the vehicle's "advancedLights" variable specifies what kind of siren to play in the first speaker
// if the lights have never been activated, initialize it to the basic type
if(isNil {_vehicle getVariable "advancedLights"}) then {
	_vehicle setVariable ["advancedLights", false, true];
};

_modeChanged = true;
// this is a loop that keeps the script going when the user changes the light mode.
// if there's something wrong with the vehicle, or the vehicle's lights aren't supposed to be on, then break out
while {_modeChanged && !isNil "_vehicle" && !isNull _vehicle && _vehicle getVariable ["lights",false]} do {


	// are the user's advanced emergency lights enabled? (strobe)
	_advancedLights = _vehicle getVariable ["advancedLights", false];

	// what kind of vehicle is it?
	_quadbike = typeof _vehicle == "I_Quadbike_01_F";
	_offroad = typeof _vehicle in ["C_Offroad_01_F","B_G_Offroad_01_armed_F"];
	_SUV = typeof _vehicle == "C_SUV_01_F";
	_hatchback = typeof _vehicle == "C_Hatchback_01_sport_F";
	_hunter = typeof _vehicle == "B_MRAP_01_F";
	_strider = typeof _vehicle == "I_MRAP_03_F";
	_hummingbird = typeof _vehicle == "B_Heli_Light_01_F";
	_huron = typeof _vehicle == "B_Heli_Transport_03_unarmed_F";
	_hellcat = typeof _vehicle == "I_Heli_light_03_unarmed_F";
	_orca = typeof _vehicle == "O_Heli_Light_02_unarmed_F";
	_ghosthawk = typeof _vehicle == "B_Heli_Transport_01_F";

	// if it's not a police vehicle, then don't put the lights on it!
	if(!(_quadbike || _offroad || _SUV || _hatchback || _hunter || _strider || _hummingbird || _huron || _hellcat || _orca || _ghosthawk)) exitWith{};

	// if it's a real vehicle (and not a quadbike), then slap some extra lights on it if it's in advanced mode
	_extraLights = _advancedLights && !_quadbike;

	// set the ambient colours
	_lightRed = [0.025, 0.005, 0.005];
	_lightBlue = [0.005, 0.005, 0.025];

	// set the light colours
	_lightBrightRed = [1, 0.2, 0.2];
	_lightBrightBlue = [0.2, 0.2, 1];

	// set other fun parameters
	_lightHighBrightness = 10;
	_lightLowBrightness = 7;
	_lightAttenuation = [0.181, 0, 1000, 20];
	_lightFlareSize = 0.3;
	_lightFlareMaxDistance = 150;
	_lightUseFlare = true;
	_offsetMultiplier = 0.07;

	// set default light flash properties
	_numStrobes = 1;
	_strobeTimeOn = 0.32;
	_strobeTimeOff = 0;

	// if we're running the fancy advanced lights, set the strobe
	if(_advancedLights) then {
		_numStrobes = 3;
		_strobeTimeOn = 0.1;
		_strobeTimeOff = 0.02;
	};

	_alphaLights = [];
	_betaLights = [];

	_attachLight = {
		_isAlpha = _this select 0;
		_colour = _this select 1;
		_position = _this select 2;
		_light = "#lightpoint" createVehicleLocal [100000,100000,100000];
		_light setLightDayLight true;
		_light setLightBrightness 0;
		_light setLightAttenuation _lightAttenuation;
		_light setLightFlareSize _lightFlareSize;
		_light setLightFlareMaxDistance _lightFlareMaxDistance;
		_light setLightUseFlare _lightUseFlare;

		switch (_colour) do {
			case "blue": {
				_light setLightColor _lightBrightBlue;
				_light setLightAmbient _lightBlue;
			};
			case "red": {
				_light setLightColor _lightBrightRed;
				_light setLightAmbient _lightRed;
			};
		};

		if(_isAlpha) then {
			_alphaLights = _alphaLights + [[_light, _position]];
		} else {
			_betaLights = _betaLights + [[_light, _position]];
		};
		_light attachTo [_vehicle, _position];
	};

	// put the lights on the quadbike in the appropriate location
	if(_quadbike) then {
		_offsetMultiplier = 0.07;
		[true, "blue", [-0.07, 1, -0.7]] call _attachLight;
		[false, "red", [0.07, 1, -0.7]] call _attachLight;
	};

	// put the lights on the offroad in the appropriate location
	if(_offroad) then {
		_offsetMultiplier = 0.069;
		[true, "red", [-0.45, 0.0, 0.56]] call _attachLight;
		if(_extraLights) then {
			[false, "red", [0.35, 0.0, 0.56]] call _attachLight;
			[false, "blue", [-0.25, 0.0, 0.56]] call _attachLight;
			[true, "blue", [0.15, 0.0, 0.56]] call _attachLight;

			[true, "red", [0.2, 2.5, -0.7]] call _attachLight;
			[false, "red", [-0.3, 2.5, -0.7]] call _attachLight;

			[false, "blue", [0.2, 2.4, -0.44]] call _attachLight;
			[true, "blue", [-0.3, 2.4, -0.44]] call _attachLight;

			[true, "red", [-0.85, -2.9, -0.38]] call _attachLight;
			[false, "blue", [0.75, -2.9, -0.38]] call _attachLight;
		} else {
			[false, "blue", [0.35, 0.0, 0.56]] call _attachLight;
		};
	};

	// put the lights on the SUV in the appropriate location
	if(_SUV) then {
		_offsetMultiplier = 0.067;
		[true, "red", [-0.55, 0.6, -0.1]] call _attachLight;
		[false, "blue", [0.55, 0.6, -0.1]] call _attachLight;
		if(_extraLights) then {
			[false, "red", [-0.5, -0, 0.3]] call _attachLight;
			[true, "blue", [0.5, -0, 0.3]] call _attachLight;

			[true, "blue", [-0.45, 2.15, -1]] call _attachLight;
			[false, "red", [0.45, 2.15, -1]] call _attachLight;

			[false, "red", [-0.5, -2.9, -0.2]] call _attachLight;
			[true, "blue", [-0.4, -1.8, 0.25]] call _attachLight;

			[true, "red", [0.4, -1.8, 0.25]] call _attachLight;
			[false, "blue", [0.5, -2.9, -0.2]] call _attachLight;
		};
	};

	// put the lights on the hatchback in the appropriate location
	if(_hatchback) then {
		_offsetMultiplier = 0.072;
		[true, "blue", [-0.45, -0, 0.2]] call _attachLight;
		[false, "red", [0.4, -0, 0.2]] call _attachLight;
		if(_extraLights) then {
			[false, "blue", [-0.45, 0.9, -0.2]] call _attachLight;
			[true, "red", [0.45, 0.9, -0.2]] call _attachLight;

			[true, "blue", [0.55, 1.85, -0.9]] call _attachLight;
			[false, "red", [-0.6, 1.85, -0.95]] call _attachLight;

			[true, "red", [0.7, -2.3, -0.3]] call _attachLight;
			[true, "blue", [-0.8, -2.3, -0.3]] call _attachLight;

			[false, "red", [-0.5, -2.3, -1]] call _attachLight;
			[false, "blue", [0.4, -2.3, -1]] call _attachLight;
		};
	};

	// put the lights on the hunter in the appropriate location
	if(_hunter) then {
		_offsetMultiplier = 0.072;
		[true, "blue", [-0.5, 1.5, -0.7]] call _attachLight;
		[false, "red", [0.5, 1.5, -0.7]] call _attachLight;

		[false, "blue", [-0.4, -1.2, 0.55]] call _attachLight;
		[true, "red", [0.4, -1.2, 0.55]] call _attachLight;

		if(_extraLights) then {
			[true, "red", [-0.8, -0.6, -1.3]] call _attachLight;
			[false, "blue", [0.8, -0.6, -1.3]] call _attachLight;

			[false, "red", [0.8, -2.5, -1.3]] call _attachLight;
			[true, "blue", [-0.8, -2.5, -1.3]] call _attachLight;

			[true, "red", [-0.95, -4.25, -0.75]] call _attachLight;
			[false, "blue", [0.95, -4.25, -0.75]] call _attachLight;
		};
	};

	// put the lights on the strider in the appropriate location
	if(_strider) then {
		_offsetMultiplier = 0.06;
		[true, "blue", [-0.87, 2.2, -0.75]] call _attachLight;
		[false, "red", [0.87, 2.2, -0.75]] call _attachLight;

		[false, "blue", [-0.5, 1.3, 0.4]] call _attachLight;
		[true, "red", [0.5, 1.3, 0.4]] call _attachLight;

		if(_extraLights) then {
			[true, "red", [-1.2, -0.3, -1]] call _attachLight;
			[false, "blue", [1.2, -0.3, -1]] call _attachLight;

			[false, "red", [-0.75, -3.2, 0.03]] call _attachLight;
			[true, "red", [0.75, -3.2, 0.03]] call _attachLight;

			[true, "blue", [-0.8, -2.7, -0.9]] call _attachLight;
			[false, "blue", [0.8, -2.7, -0.9]] call _attachLight;
		};
	};

	if(_hummingbird) then {
		[true, "red", [-0.3, 1.82, -0.6]] call _attachLight;
		[false, "blue", [0.3, 1.82, -0.6]] call _attachLight;

		if(_extraLights) then {
			[false, "blue", [-0.8, 1.25, -1]] call _attachLight;
			[true, "red", [0.8,  1.25, -1]] call _attachLight;

			[true, "blue", [0.8, -0.2, -1]] call _attachLight;
			[false, "red", [-0.8, -0.2, -1]] call _attachLight;

			[false, "blue", [0.08, -4.55, 1.25]] call _attachLight;
			[true, "red", [0.14, -4.55, 1.25]] call _attachLight;

			[true, "blue", [0.07, -4.05, -0.1]] call _attachLight;
			[false, "red", [0.14, -4.05, -0.1]] call _attachLight;
		};
	};

	if(_huron) then {
		[true, "red", [-0.4, 8.5, -1.85]] call _attachLight;
		[false, "blue", [0.4, 8.5, -1.85]] call _attachLight;

		if(_extraLights) then {
			[false, "red", [-2.05, 3.5, -1.9]] call _attachLight;
			[true, "blue", [1.9,  3.5, -1.9]] call _attachLight;

			[true, "blue", [-2.05, -1, -1.9]] call _attachLight;
			[false, "red", [1.9, -1, -1.9]] call _attachLight;

			[false, "red", [-1.65, -3.85, -1]] call _attachLight;
			[true, "red", [0.8, -5.33, -0.1]] call _attachLight;

			[true, "blue", [-0.9, -5.33, -0.1]] call _attachLight;
			[false, "blue", [1.55, -3.85, -1]] call _attachLight;
		};
	};

	if(_hellcat) then {
		[true, "blue", [-0.37, 6.25, -0.93]] call _attachLight;

		if(_extraLights) then {
			[false, "blue", [0.37, 6.25, -0.93]] call _attachLight;

			[false, "red", [-1.2, 3.85, -1.5]] call _attachLight;
			[true, "blue", [1.2, 3.85, -1.5]] call _attachLight;

			[true, "blue", [0.5, -0.26, -0.17]] call _attachLight;
			[false, "red", [-0.5, -0.26, -0.17]] call _attachLight;

			[false, "red", [-1.26, -4.35, -0.05]] call _attachLight;
			[true, "red", [1.25, -4.35, -0.05]] call _attachLight;

			[true, "blue", [-1.26, -3.95, -0.64]] call _attachLight;
			[false, "blue", [1.25, -3.95, -0.64]] call _attachLight;
		} else {
			[false, "red", [0.37, 6.25, -0.93]] call _attachLight;
		};
	};

	if(_orca) then {
		[true, "blue", [-0.37, 5.2, -1.7]] call _attachLight;

		if(_extraLights) then {
			[false, "blue", [0.37, 5.2, -1.7]] call _attachLight;

			[false, "red", [-0.9, 3, -1.5]] call _attachLight;
			[true, "red", [0.9, 3, -1.5]] call _attachLight;

			[true, "blue", [0.8, -1, 0.4]] call _attachLight;
			[false, "blue", [-0.8, -1, 0.4]] call _attachLight;

			[true, "red", [-1.35, -4.9, 0]] call _attachLight;
			[false, "red", [1.35, -4.9, 0]] call _attachLight;

			[false, "blue", [-1.35, -4.64, -0.77]] call _attachLight;
			[true, "blue", [1.35, -4.64, -0.77]] call _attachLight;
		} else {
			[false, "red", [0.37, 5.2, -1.7]] call _attachLight;
		};
	};

	if(_ghosthawk) then {
		[true, "blue", [0.7, 6.85, -1.25]] call _attachLight;

		if(_extraLights) then {
			[false, "blue", [-0.7, 6.85, -1.25]] call _attachLight;

			[false, "red", [-1.1, 2.9, -1.56]] call _attachLight;
			[true, "red", [1.2, 2.9, -1.56]] call _attachLight;

			[true, "blue", [0.65, -0.7, -0.2]] call _attachLight;
			[false, "blue", [-0.55, -0.7, -0.2]] call _attachLight;

			[false, "red", [-0.04, -7.1, 0.7]] call _attachLight;
			[true, "blue", [0.19, -7.1, 0.7]] call _attachLight;

			[true, "blue", [-0.15, -6, -0.85]] call _attachLight;
			[false, "red", [0.25, -6, -0.85]] call _attachLight;
		} else {
			[false, "red", [-0.7, 6.85, -1.25]] call _attachLight;
		};
	};

	_modeChanged = false;

	// start the loop that flashes the lights. Break out of it if the vehicle dies, if someone turns off the lights, or if someone changes the light mode
	while{(alive _vehicle && _vehicle getVariable ["lights",false] && !_modeChanged)} do
	{
		// turn on the first set, strobe them if desired
		for [{_i=0}, {_i<_numStrobes}, {_i=_i+1}] do {
			{
				(_x select 0) setLightBrightness _lightHighBrightness;
			} forEach _alphaLights;
			sleep _strobeTimeOn;
			{
				(_x select 0) setLightBrightness _lightLowBrightness;
			} forEach _alphaLights;
			sleep _strobeTimeOff;
		};
		{
			(_x select 0) setLightBrightness 0;
		} forEach _alphaLights;


		// turn on the second set, strobe them if desired
		for [{_i=0}, {_i<_numStrobes}, {_i=_i+1}] do {
			{
				(_x select 0) setLightBrightness _lightHighBrightness;
			} forEach _betaLights;
			sleep _strobeTimeOn;
			{
				(_x select 0) setLightBrightness _lightLowBrightness;
			} forEach _betaLights;
			sleep _strobeTimeOff;
		};
		{
			(_x select 0) setLightBrightness 0;
		} forEach _betaLights;

		// has someone changed our lighting mode?
		_modeChanged = (_vehicle getVariable ["advancedLights",false] && !_advancedLights) || (!(_vehicle getVariable ["advancedLights", false]) && _advancedLights);
	};


	// delete all those fancy lights we created so it doesn't lag the server
	{
		deleteVehicle (_x select 0);
	} forEach _alphaLights;
	{
		deleteVehicle  (_x select 0);
	} forEach _betaLights;
	_alphaLights = [];
	_betaLights = [];
};

// when we turn off the lights, disable the advanced mode
_vehicle setVariable ["advancedLights", false, true];