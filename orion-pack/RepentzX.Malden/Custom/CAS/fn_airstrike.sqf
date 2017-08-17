#include "..\..\script_macros.hpp"
_caller = _this select 0;

createDialog "life_CAS_MENU";
["Select a location by clicking on the map, select the weapon type, select the type of jet.",false,"slow"] call life_fnc_notificationSystem;

while {dialog && alive _caller} do {
	mapclick = false;
	onMapSingleClick "
	deleteMarker 'CAS_MRK';
	_marker = createMarker['CAS_MRK', _pos];
	_marker setMarkerType 'mil_destroy';
	_marker setMarkerSize[0.5, 0.5];
	_marker setMarkerColor 'ColorRed';
	_marker setMarkerText 'CAS Target';

	CAStargetPos = _pos;
	mapclick = true;
	onMapSingleClick '';
	true;
	";

	if (!dialog) exitWith {onMapSingleClick "mapclick = false; false"};
	
	sleep 0.1;
};