private["_gate"];
_trigger = _this select 0;
_copGate = _this select 1;

_gate = nearestObject [_trigger, "Land_BarGate_F"];

_trigger setVariable ["owner", player, true];
[_trigger, _gate, _copGate] spawn {
	_trigger = _this select 0;
	_gate = _this select 1;
	_copGate = _this select 2;
	_distance = player distance _gate;
	_loopCounter = 0;
	_stillOwner = true;
	while {_distance < 100 && alive player && _stillOwner} do {
		_rot = _gate animationPhase "Door_1_rot";
		_gateMax = _gate getVariable ["gate_max", 0];
		if(_rot > _gateMax) then {
			_gate animate ["Door_1_rot", _gateMax];
		} else {
			if(_rot < _gateMax && _copGate) then {
				_gate animate ["Door_1_rot", _gateMax];
			};
		};
		if(_loopCounter % 20 == 0) then {
			_distance = player distance _gate;
			_stillOwner = (_trigger getVariable ["owner", player] == player); // if someone else somehow took ownership, we can stop monitoring
		};
		sleep 0.1;
	};
	_trigger setVariable ["owner", objNull, true];
};