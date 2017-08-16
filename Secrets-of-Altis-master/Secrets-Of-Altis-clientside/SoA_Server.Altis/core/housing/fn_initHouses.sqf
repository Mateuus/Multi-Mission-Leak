/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
private["_houseName"];
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = nearestBuilding _position;
	_house setVariable["uid",round(random 99999),true];
	//_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	if(typeOf _house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
		_houseName = "Deine Garage";
	} else {
		_houseName = "Dein Haus";
	};

	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	
} foreach life_houses;