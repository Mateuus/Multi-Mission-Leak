/*
	fn_animateJonzies.sqf
	Pennyworth
*/

params ["_switch","_vehicle",["_animations", []]];
diag_log str [_switch,_vehicle,_animations];

switch (_switch) do {
	//getting available anims
	case 0: {
		switch (typeOf _vehicle) do {
			case "Jonzie_Raptor": {["Addon_1","Addon_2","Addon_3","Addon_4"]};
			case "Jonzie_Ute": {["Addon_2","Addon_3"]};
			default {[]};
		};
	};
	//checking current anims
	case 1: {
		_currentAnims = [];
		{
			_currentAnims pushBack [_x, _vehicle animationPhase _x];
		} foreach _animations;
		_currentAnims;
	};
	//setting anims
	case 2: {
		{
			if(_vehicle animationPhase (_x select 0) != (_x select 1)) then {
				_vehicle animate [_x select 0, _x select 1];
				if(typeOf _vehicle isEqualTo "Jonzie_Raptor" && {_x select 0 isEqualTo "Addon_2"}) then {
					_vehicle spawn {
						_vehicle = _this;
						_spotlight1 = "Jonzie_Driving_Lights_Raptor" createVehicle [0,0,100];
						waitUntil {!isNil "_spotlight1" && {!isNull _spotlight1}};
						_spotlight1 attachTo [_vehicle, [0, 0, 0], "Light_1"];
						_spotlight2 = "Jonzie_Driving_Lights_Raptor" createVehicle [0,0,100];
						waitUntil {!isNil "_spotlight2" && {!isNull _spotlight2}};
						_spotlight2 attachTo [_vehicle, [0, 0, 0], "Light_2"];
						_spotlight3 = "Jonzie_Driving_Lights_Raptor" createVehicle [0,0,100];
						waitUntil {!isNil "_spotlight3" && {!isNull _spotlight3}};
						_spotlight3 attachTo [_vehicle, [0, 0, 0], "Light_3"];					
						_spotlight4 = "Jonzie_Driving_Lights_Raptor" createVehicle [0,0,100];
						waitUntil {!isNil "_spotlight4" && {!isNull _spotlight4}};
						_spotlight4 attachTo [_vehicle, [0, 0, 0], "Light_4"];
						_spotlight5 = "Jonzie_Driving_Lights_Raptor" createVehicle [0,0,100];
						waitUntil {!isNil "_spotlight5" && {!isNull _spotlight5}};
						_spotlight5 attachTo [_vehicle, [0, 0, 0], "Light_5"];
						_spotlight6 = "Jonzie_Driving_Lights_Raptor" createVehicle [0,0,100];
						waitUntil {!isNil "_spotlight6" && {!isNull _spotlight6}};
						_spotlight6 attachTo [_vehicle, [0, 0, 0], "Light_6"];
						_vehicle setVariable ["spotlights",[_spotlight1,_spotlight2,_spotlight3,_spotlight4,_spotlight5,_spotlight6],true];
					};
				};
			};
		} foreach _animations;
	};
};