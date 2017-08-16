private["_vehicle","_unit","_giver"];
_vehicle = _this select 0;
_unit = _this select 1;
_giver = _this select 2;
if(isNil "_unit" OR isNil "_giver") exitWith {};
if(player == _unit && !(_vehicle in life_vehicles)) then
{
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	hint format["%1 has given you keys for a %2",_giver,_name];
	life_vehicles set[count life_vehicles, _vehicle];
};