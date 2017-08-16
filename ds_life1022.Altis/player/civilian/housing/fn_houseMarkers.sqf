/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Puts down markers for a players house (And clan base)
*/

private ["_houseArray","_location","_counter","_house","_fail","_typeOfBuilding","_marker"];

if(DS_houses isEqualTo [])exitWith{};

_houseArray = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F",
	"Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];

{
	_location = call compile format ["%1",_x];
	_counter = 0;
	_house = nearestObjects [_location,["House","Building"],50] select _counter;
	_fail = false;

	if(!((typeOf _house) in _houseArray))then {
		while{true}do {
			_counter = _counter + 1;
			_house = nearestObjects [_location,["House","Building"],30] select _counter;
			diag_log format ["HOUSE 4 || %1",_house];
			if((typeOf _house) in _houseArray)exitWith{};
			if(_counter > 20)exitWith{_fail = true};
		};
	};

	if(!_fail)then {
		_house setVariable ["markerID",(round(random 99999)),true];
		_typeOfBuilding = getText (configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_marker = createMarkerLocal [format ["Property_%1",(_house getVariable "markerID")],(getPos _house)];
		_marker setMarkerTextLocal _typeOfBuilding;
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
		DS_houseMarkers pushBack _marker;
	};
} forEach DS_houses;