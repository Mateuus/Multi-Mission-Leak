#include "..\..\..\script_macros.hpp"
/*
 Created by repentz
*/

private ["_type", "_sp", "_inProgress", "_endPoint", "_distance"];

_endPoint = selectRandom ["missionEnd_1","missionEnd_2","missionEnd_3","missionEnd_4"];

if(player getVariable ["taskStart",true]) exitWith {hint "You've already started a mission";};
if !(playerSide isEqualTo west) exitWith {hint "You are not a cop!"};

player setVariable ["taskStart", true, true];

["You have started a police mission, you are required to take some documents to the point selected on the map, please do so to recieve a reward, make sure to continue your patrol whilst doing this mission.",false,"slow"] call life_fnc_notificationSystem;
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
		"EndPointT" setMarkerTextLocal "Deliver Documents Here";
		"EndPointT" setMarkerTypeLocal "mil_objective";
//} forEach (units group player);
_distance = player distance (getMarkerPos _endPoint);
_distance = floor(_distance);

waitUntil {
	_distance = player distance (getMarkerPos _endPoint);
	_distance = floor(_distance);
	_distance < 30;
};
life_collectMoneys = player addaction ["Complete Mission",life_fnc_missionFinish];

["You've reached your destination scrollwheel to complete the mission.",false,"slow"] call life_fnc_notificationSystem;
deleteMarkerLocal "EndPointM";
deleteMarkerLocal "EndPointT";


