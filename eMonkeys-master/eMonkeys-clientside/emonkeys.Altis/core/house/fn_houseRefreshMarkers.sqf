/*
*	refreshes all markers
*
*/

private ["_house_names", "_marker_name", "_house_marker_position"];


	_house_names = missionNamespace getVariable "spawn_home_list";
	{
	_x = _x select 0;
	_house_marker_position = getMarkerPos format["%1",_x];
	_house_name1 = format["marker_%1", _x];
	_house = nearestBuilding _house_marker_position;
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	deleteMarkerlocal _house_name1;
	_house_name1 = createMarkerlocal [_house_name1, _house_marker_position];
	_house_name1 setMarkerTextlocal _houseName;
	_house_name1 setMarkerColorLocal "ColorBlue";
	_house_name1 setMarkerTypeLocal "loc_Lighthouse";
		}
foreach (_house_names select 0);
_house_names2 = missionNamespace getVariable "spawn_home_list";
_house_names1 = _house_names2 select 0;
EMonkeys_housecount = count _house_names1;