/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_number = param [0,-1,[0]];
if(_number isEqualTo -1) exitWith {};
if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select a Player!";};
disableSerialization;
_info = lbData[1500,lbCurSel (1500)];
_info = call compile format["%1", _info];
if(isNil "_info") exitWith {hintSilent "Error";};
if(isNull _info) exitWith {hintSilent "Error";};

switch(_number) do {
  case 0: {
    if(isNull objectParent player) exitWith {"You're not in a Vehicle!";};
    _pos = position _info;
		if (count _pos > 0) then {
			vehicle player setPos _pos;
      call life_fnc_brefr;
		} else {hintSilent "No position found at Players location";};
  };
  case 1: {
    if!(vehicle player isEqualTo player) exitWith {"You must get out of the vehicle!";};
    _pos = position _info findEmptyPosition [0,10];
		if (count _pos > 0) then {
			player setPos _pos;
      call life_fnc_brefr;
		} else {hintSilent "No position found at Players location";};
  };
  case 2: {
    _pos = position player;
		if (count _pos > 0) then {
			_info setPos _pos;
      call life_fnc_brefr;
		} else {hintSilent "No position found at players location";};
  };
  case 3: {
    _pos = position player findEmptyPosition [0,10];
		if (count _pos > 0) then {
			vehicle _info setPos _pos;
      call life_fnc_brefr;
		} else {hintSilent "No empty position found at players location";};
  };
  default {};
};
