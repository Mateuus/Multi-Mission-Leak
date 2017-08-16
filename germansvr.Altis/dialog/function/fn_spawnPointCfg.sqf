#include "..\..\script_macros.hpp"
/*
    File: fn_spawnPointCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for available spawn points depending on the units side.

    Return:
    [Spawn Marker,Spawn Name,Image Path]
*/
private ["_side","_return","_spawnCfg","_curConfig","_name","_licenses","_tempConfig","_flag"];
switch (playerSide) do {
	case civilian: {_side = "Civilian"};  
    case west: {_side = "Cop"};
    case independent: {_side = "Medic"};
    case east: {_side = "Imperium"};
};
_return = [];

_spawnCfg = missionConfigFile >> "CfgSpawnPoints" >> "Altis" >> _side;

for "_i" from 0 to count(_spawnCfg)-1 do {
    _flag = true;
    _tempConfig = [];
    _curConfig = (_spawnCfg select _i);
	_licenses = getArray(_curConfig >> "licenses");
    if (!((_licenses select 0) isEqualTo {})) then {
        _licenseName = (_licenses select 0);
        _licenseType = (_licenses select 1);
        if (_licenseType isEqualTo 0) then {
          if (LICENSE_VALUE(_licenseName,(M_CONFIG(getText,"Licenses",_licenseName,"side")))) exitWith {_flag = false};
        } else {
          if (!(LICENSE_VALUE(_licenseName,(M_CONFIG(getText,"Licenses",_licenseName,"side"))))) exitWith {_flag = false};
        };
    };
    
    if (_flag) then {
		_tempConfig pushBack getText(_curConfig >> "spawnMarker");
		_tempConfig pushBack getText(_curConfig >> "displayName");
		_tempConfig pushBack getText(_curConfig >> "icon");
		_return pushBack _tempConfig;
    };
};

if (playerSide in [civilian,east]) then {
  if (count life_houses > 0) then {
    {
      _pos = call compile format ["%1",(_x select 0)];
      _house = nearestObject [_pos, "House"];
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

      _return pushBack [format ["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
    } forEach life_houses;
  };
};

_return;
