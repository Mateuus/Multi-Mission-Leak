/*
	File: fn_createMarkers.sqf
	Author: Mario2002
	
	Description:
	creates the markers for player houses locally
*/

for "_i" from 1 to (count life_houses) do
{
	if(typeName ((life_houses select (_i-1)) select 0) == "ARRAY") then {
		
		_house = nearestObject [((life_houses select (_i-1)) select 0), "House_F"];
		_marker = createMarkerLocal [format["house_%1", _i], ((life_houses select (_i-1)) select 0)];
		_marker setMarkerTextLocal getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "mil_end";		
		life_houses_markers set [count life_houses_markers, _marker];
	};
};