#include "..\..\..\script_macros.hpp"
/*
 Created by repentz
*/

private ["_type", "_sp", "_inProgress", "_endPoint", "_distance"];

_endPoint = selectRandom ["transportMission_1","transportMission_2","transportMission_3","transportMission_4"];

if(player getVariable ["taskStartCiv",true]) exitWith {hint "You've already started a mission";};
if !(playerSide isEqualTo civilian) exitWith {hint "You are not a civilian!"};

player setVariable ["taskStartCiv", true, true];

["You have started a transport mission, you are required to take some supplies to the point selected on the map, please do so to recieve a reward.",false,"slow"] call life_fnc_notificationSystem;
//{
		deleteMarkerLocal "EndPointM";
		deleteMarkerLocal "EndPointT";
		_marker = createMarkerLocal ["EndPointM", getMarkerPos _endPoint];
		"EndPointM" setMarkerColorLocal "ColorRed";
		"EndPointM" setMarkerTypeLocal "Empty";
		"EndPointM" setMarkerShapeLocal "ELLIPSE";
		"EndPointM" setMarkerSizeLocal [30,30];
		_markerText = createMarkerLocal ["EndPointT", getMarkerPos _endPoint];
		"EndPointT" setMarkerColorLocal "ColorBlack";
		"EndPointT" setMarkerTextLocal "Deliver Supplies Here";
		"EndPointT" setMarkerTypeLocal "mil_objective";
//} forEach (units group player);
_distance = player distance (getMarkerPos _endPoint);
_distance = floor(_distance);

waitUntil {
	_distance = player distance (getMarkerPos _endPoint);
	_distance = floor(_distance);
	_distance < 30;
};
life_collectMoneys = player addaction ["Complete Mission",life_fnc_CivMissionFinish];

["You've reached your destination scrollwheel to complete the mission.",false,"slow"] call life_fnc_notificationSystem;
deleteMarkerLocal "EndPointM";
deleteMarkerLocal "EndPointT";
