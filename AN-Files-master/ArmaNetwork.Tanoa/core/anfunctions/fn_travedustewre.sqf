private["_vehicle","_unit","_giver"];
_vehicle = _this select 0;
_unit = _this select 1;
_giver = param [2,"",[""]];
if(isNil "_unit" OR {isNil "_giver"} OR {_giver isEqualTo ""}) exitWith {};
if(player isEqualTo _unit && {!(_vehicle in life_vehicles)}) then {
  _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
  ["GivenKeys"] call life_fnc_notificationHandler;
  life_vehicles pushBack _vehicle;
  [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];
};
