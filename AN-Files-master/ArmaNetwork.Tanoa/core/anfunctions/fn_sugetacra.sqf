/*
  ArmA.Network
  Rathbone
  Converts time
*/
_h = _this select 0;
_m = _this select 1;
_time = [];
if (_h < 10) then {
	_time = [format ["0%1",_h]];
} else {
	_time = [format ["%1",_h]];
};
if (_m < 10) then {
	_time = _time + [format ["0%1",_m]];
} else {
	_time = _time + [format ["%1",_m]];
};
_time
