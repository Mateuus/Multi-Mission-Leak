private ["_bomb", "_time"];

_bomb = param [0,ObjNull,[ObjNull]];
_time = param [ 1, 0, [0]];

//Validate parameters
if (isNull _bomb) exitWith {"Object parameter must not be objNull. Accepted: OBJECT" call BIS_fnc_error};

while {_time > 0 && !DEFUSED} do {
	_time = _time - 1;
	hintSilent format["Bomb Detonation: \n %1", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];

	if (_time < 1) then {
		_blast = createVehicle ["HelicopterExploSmall", position _bomb, [], 0, "NONE"];
		{
			if (_x distance _bomb <= 15) then {_x setDamage 1};
		} forEach allUnits;
	};
	if (ARMED) then {
		_time = 5;
		ARMED = false
	};

	sleep 1;
};

deleteVehicle _bomb;

//Return Value
_bomb