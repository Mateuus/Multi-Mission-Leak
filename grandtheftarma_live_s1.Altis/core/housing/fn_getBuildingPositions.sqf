private ["_building", "_positions", "_blacklist", "_i", "_exitLoop"];
_building = _this select 0;
_positions = [];

_blacklist = switch (typeOf _building) do {
  case "Land_i_House_Big_02_V1_F";
  case "Land_i_House_Big_02_V2_F";
  case "Land_i_House_Big_02_V3_F": {[0, 1, 2, 3, 4]};
  case "Land_i_House_Big_01_V1_F";
  case "Land_i_House_Big_01_V2_F";
  case "Land_i_House_Big_01_V3_F": {[0, 2, 3]};
  case "Land_i_Stone_HouseSmall_V1_F";
  case "Land_i_Stone_HouseSmall_V2_F";
  case "Land_i_Stone_HouseSmall_V3_F": {[0, 1, 3, 4]};
  case "Land_i_Stone_Shed_V1_F";
  case "Land_i_Stone_Shed_V2_F";
  case "Land_i_Stone_Shed_V3_F": {[0,2]};
  case "Land_Slum_House02_F": {[0,1,2]};	
  default {[]};
};

_i = 0;
_exitLoop = false;
while {true} do {
	if !(_i in _blacklist) then {
  	_pos = _building buildingPos _i;
  	if (_pos isEqualTo [0, 0, 0]) exitWith {_exitLoop = true};
  	_positions pushBack _pos;
	};
	if (_exitLoop) exitWith {};
	_i = _i + 1;
};

_positions
