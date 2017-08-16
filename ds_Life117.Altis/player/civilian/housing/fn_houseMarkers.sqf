/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Puts down markers for a players house (And clan base)
*/
if(DS_houses isEqualTo [])Exitwith{};//Player has no houses

{
	_loc = call compile format ["%1",_x];
	_building = nearestBuilding _loc;
	if(_building distance _loc > 50)then
		{
		_building = nearestObject _loc;
		};
	_building setVariable ["markerID",(round(random 99999)),true];
	_typeOfBuilding = getText(configFile >> "CfgVehicles" >> (typeOf _building) >> "displayName");
	_marker = createMarkerLocal [format["Property_%1",(_building getVariable "markerID")],(getPos _building)];
	DS_houseMarkers pushBack _marker;
	_marker setMarkerTextLocal _typeOfBuilding;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
}forEach DS_houses;









