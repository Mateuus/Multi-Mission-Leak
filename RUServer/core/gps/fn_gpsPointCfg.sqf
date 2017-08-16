#include "..\..\script_macros.hpp"
/*
    File: fn_gpsPointCfg.sqf
	
    Description:
    Master configuration for available GPS points depending on the units side.

    Return:
    [GPS Marker,GPS Name,Image Path]
*/

params [["_side",civilian,[civilian]]];

_side = switch (_side) do {
    case west: {"Cop"};
    case independent: {"Medic"};
    default {"Civilian"};
};

private _return = [];

private _spawnCfg = missionConfigFile >> "CfgGPSPoints" >> worldName >> _side;

for "_i" from 0 to count(_spawnCfg)-1 do {

    private _tempConfig = [];
    private _curConfig = (_spawnCfg select _i);
    private _conditions = getText(_curConfig >> "conditions");

        _tempConfig pushBack getText(_curConfig >> "gpsMarker");
        _tempConfig pushBack getText(_curConfig >> "displayName");
        _tempConfig pushBack getText(_curConfig >> "icon");
        _return pushBack _tempConfig;
};
if (playerSide isEqualTo civilian) then {
  if (count life_houses > 0) then {
    {
      _pos = call compile format ["%1",(_x select 0)];
      _house = nearestObject [_pos, "House"];
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
      _return pushBack [format ["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
      
      true
    } count life_houses;
  };
};

_return;
