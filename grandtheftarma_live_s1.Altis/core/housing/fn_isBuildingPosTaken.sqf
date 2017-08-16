private["_position","_nearestObjs"];
_position = [_this,0,[],[[]]] call GTA_fnc_param;
if(count _position == 0) exitWith {true};

_nearestObjs = nearestObjects [_position,["B_supplyCrate_F","Land_Box_AmmoOld_F"],3.8];
if(count _nearestObjs == 0) then {false} else {true};