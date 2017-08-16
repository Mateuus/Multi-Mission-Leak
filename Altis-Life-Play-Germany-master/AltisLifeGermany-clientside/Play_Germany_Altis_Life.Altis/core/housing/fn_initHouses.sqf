/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = nearestBuilding _position;
	_house setVariable["uid",round(random 99999),true];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
	if (_house getVariable ["house_security",0] > 0) then {
		_marker setMarkerTextLocal format["%1 [alarmgesichert]",_houseName];
	} else {
		_marker setMarkerTextLocal _houseName;
	};
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	
	if(isNil {_house getVariable "HouseSpawnBlockTime"}) then {
		_house setVariable["HouseSpawnBlockTime",-1200,true];
	};
} foreach life_houses;