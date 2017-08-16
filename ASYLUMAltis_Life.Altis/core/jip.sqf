/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine / John "Paratus" VanderZwet
	
	Description:
	JIP functionality for JIP required things like vehicles.
*/

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
	if (_x getVariable ["signal",0] > 0) then
	{
		[_x,_x getVariable "signal"] spawn life_fnc_turnSignal;
	};
} forEach (allMissionObjects "Car");

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} forEach (allMissionObjects "Air");

{
	_texture = _x getVariable "customTexture";
	if (!isNil "_texture") then
	{
		[_x, _texture] call life_fnc_setUniform;
	};	
} forEach playableUnits;

{
	[_x] spawn life_fnc_crateAction;
} forEach ((entities "Box_East_WpsSpecial_F") + (entities "Box_East_Support_F") + (entities "Land_WaterBarrel_F"));