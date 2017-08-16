_key = param[0,"",[""]];
_vehicleType = param[1,"",[""]];
_return = [];
_configPath = missionConfigFile >> "CfgVehicles" >> _vehicleType >> "textures";
for [{_i = 0},{_i < count(_configPath)},{_i = _i + 1}] do {
  _entry = _configPath select _i;
  if(isClass (_entry >> _key)) then {
      _name = getText(_entry >> _key >> "name");
      _textures = getArray(_entry >> _key >> "textures");
      _return = [_name,_textures];
  	if(count _return > 0) exitWith {};
  };
};
_return;
