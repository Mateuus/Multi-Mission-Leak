private ["_vehicle","_lightArray","_type","_side","_counter","_isDaytime","_lightFrontL","_lightFrontR","_lightRearL","_lightRearR","_lightPos","_lights","_light","_frontPosL","_frontPosR","_rearPosL","_rearPosR","_bright"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_lightArray = [_this,1,["",[0,0,0],[0,0,0],[0,0,0],[0,0,0]],[[]]] call BIS_fnc_param;
_type = [_this,2,0,[0]] call BIS_fnc_param;
_side = [_this,3,0,[0]] call BIS_fnc_param;

_counter = 0;

//Daytime check
_isDaytime = false;
if((daytime > 6.2) && (daytime < 17.2))then{_isDaytime = true;};

//Define the lights
_lightFrontL = objNull;
_lightFrontR = objNull;
_lightRearL = objNull;
_lightRearR = objNull;
_lights = [_lightFrontL,_lightFrontR,_lightRearL,_lightRearR];

//Removes all lights
DS_fnc_removeLights =
	{
		{
		if (!isNull _x) then {deleteVehicle _x;};
		} forEach _lights;
	};

//Creates a light
DS_fnc_createLight =
	{
	_lightPos = [_this,0,[0,0,0],[[]]] call BIS_fnc_param;

	_light = "#lightpoint" createVehicleLocal (getPosATL _vehicle);
	_light setLightBrightness 0;
	_light setLightFlareSize 0.38;
	_light setLightColor [1,0.65,0];
	_light setLightAmbient [1,0.65,0];
	_light setLightIntensity 0;
	_light setLightUseFlare true;
	_light setLightDayLight true;
	_light setLightFlareMaxDistance 150;
	_light lightAttachObject [_vehicle,_lightPos];

	if (_isDaytime) then 
		{
		_light setLightColor [60,30,0.1];
		_light setLightAttenuation [0.1,0,0.1,1300];
		} 
		else 
		{
		_light setLightAttenuation [0.1,100,100,1000];
		};

	_light
	};
	
//Brightness
_brightness = 0.3;
if(_isDaytime)then{_brightness = 3;};

//Handle indicators/hazards
_frontPosL = _lightArray select 1;
_frontPosR = _lightArray select 2;
_rearPosL = _lightArray select 3;
_rearPosR = _lightArray select 4;

switch (_type) do
	{
	case 0: //Indicators
		{
		if (!(_vehicle getVariable ["indicators",false]))exitwith{};

		switch (_side) do
			{
			case 0: //Left
				{
				_lightFrontL = [_frontPosL,0] call DS_fnc_createLight;
				_lightRearL = [_rearPosL,2] call DS_fnc_createLight;

				while {alive _vehicle} do
					{
					if(!(_vehicle getVariable ["indicators",false]))exitwith{};
					_lightFrontL setLightBrightness _brightness;
					_lightRearL setLightBrightness _brightness;
					sleep 0.5;
					_lightFrontL setLightBrightness 0;
					_lightRearL setLightBrightness 0;
					sleep 0.5;
					if(count crew _vehicle == 0)then{_counter = _counter + 1;};
					if(_counter > 50)exitwith{_vehicle setVariable ["indicators",false,false]};
					};

				call DS_fnc_removeLights;
				};
			case 1: //Right
				{
				_lightFrontR = [_frontPosR,1] call DS_fnc_createLight;
				_lightRearR = [_rearPosR,3] call DS_fnc_createLight;

				while {alive _vehicle} do
					{
					if(!(_vehicle getVariable ["indicators",false]))exitwith{};
					_lightFrontR setLightBrightness _brightness;
					_lightRearR setLightBrightness _brightness;
					sleep 0.5;
					_lightFrontR setLightBrightness 0;
					_lightRearR setLightBrightness 0;
					sleep 0.5;
					if(count crew _vehicle == 0)then{_counter = _counter + 1;};
					if(_counter > 50)exitwith{_vehicle setVariable ["indicators",false,false]};
					};

				call DS_fnc_removeLights;
				};
			};
		};

	//Hazards
	case 1:
		{
		if(!(_vehicle getVariable ["hazards",false]))exitwith{};

		_lightFrontL = [_frontPosL,0] call DS_fnc_createLight;
		_lightFrontR = [_frontPosR,1] call DS_fnc_createLight;
		_lightRearL = [_rearPosR,2] call DS_fnc_createLight;
		_lightRearR = [_rearPosL,3] call DS_fnc_createLight;

		while {alive _vehicle} do
			{
			if(!(_vehicle getVariable ["hazards",false]))exitwith{};
			_lightFrontL setLightBrightness _brightness;
			_lightFrontR setLightBrightness _brightness;
			_lightRearL setLightBrightness _brightness;
			_lightRearR setLightBrightness _brightness;
			sleep 0.5;
			_lightFrontL setLightBrightness 0;
			_lightFrontR setLightBrightness 0;
			_lightRearL setLightBrightness 0;
			_lightRearR setLightBrightness 0;
			sleep 0.5;
			if(count crew _vehicle == 0)then{_counter = _counter + 1;};
			if(_counter > 50)exitwith{_vehicle setVariable ["hazards",false,false]};
			};

		//Remove all old lights
		call DS_fnc_removeLights;
		};
};