#include "..\..\..\script_macros.hpp"
/*
	File: fn_gangConvoy.sqf
	Author: !TS JORDAN

	Desc: Starts and maintains the gang convoy mission
*/

private ["_hideout","_type", "_sp", "_inProgress", "_midPoint", "_endPoint", "_vehicle", "_distance", "_notify", "_gangMembers", "_hideoutName"];

_hideout = (nearestObjects[getPosATL player,["Land_i_Barracks_V2_F"],35]) select 0;
_hideoutName = typeOf _hideout;
_midPoint = selectRandom ["Convoy_Fill_1","Convoy_Fill_1"];
_endPoint = selectRandom ["Convoy_End_1","Convoy_End_2"];
_notify = selectRandom [1,2,3];
_gangMembers = [];

switch (_hideoutName) do {
	case "Land_i_Barracks_V2_F" : {
		_type = 1;
		_sp = getMarkerPos "Gang1_Convoy_Start";
		_inProgress = missionNamespace getVariable ["inProgressGang1", false];
	};
	case "Land_i_Barracks_V2_F" : {
		_type = 2;
		_sp = getMarkerPos "Gang2_Convoy_Start";
		_inProgress = missionNamespace getVariable ["inProgressGang2", false];
	};/*
	case "Land_i_Barracks_V2_F" : {
		_type = 3;
		_sp = getMarkerPos "Gang3_Convoy_Start";
		_inProgress = missionNamespace getVariable ["inProgressGang3", false];
	};
	case "Land_Cargo_HQ_V2_F" : {
		_type = 4;
		_sp = getMarkerPos "Gang4_Convoy_Start";
		_inProgress = missionNamespace getVariable ["inProgressGang4", false];
	};*/
};

if !(playerSide isEqualTo civilian) exitWith {hint "You are not a civilian!"};
if ([_hideout getVariable "gangOwner"] isEqualTo "") exitWith {hint "You must capture the hideout before starting a convoy!"};
if ((_hideout getVariable "gangOwner") != (group player)) exitWith {hint "You must capture the hideout before starting a convoy!"};
if (isNil {group player getVariable "gang_name"}) exitWith {"You must be in a gang to start the convoy and/or own the hideout!"};
if (_inProgress) exitWith {hint format ["Sorry, another gang is already doing gang hideout %1's convoy. Try again later!", _type]};
if (civRDM <= 14999) exitWith {hint "Sorry, you need to invest $15,000 before you can start the convoy!"};

switch (_type) do {
	case 1 : {missionNamespace setVariable ["inProgressGang1", true, true]};
	case 2 : {missionNamespace setVariable ["inProgressGang2", true, true]};
	case 3 : {missionNamespace setVariable ["inProgressGang3", true, true]};
	case 4 : {missionNamespace setVariable ["inProgressGang4", true, true]};
};

civRDM = civRDM - 15000;
_vehicle = "C_Truck_02_covered_F" createVehicle _sp;
_vehicle setVariable ["notFilled", true, false];
_vehicle setVariable ["convoyFilled", false, true];
_vehicle setVariable ["convoyFinished", false, true];
hint "The convoy has started, take the spawn truck to the filling point marked on map!";
{
		deleteMarkerLocal "MidPointM";
		deleteMarkerLocal "MidPointT";
		_marker = createMarkerLocal ["MidPointM", getMarkerPos _midPoint];
		"MidPointM" setMarkerColorLocal "ColorRed";
		"MidPointM" setMarkerTypeLocal "Empty";
		"MidPointM" setMarkerShapeLocal "ELLIPSE";
		"MidPointM" setMarkerSizeLocal [30,30];
		_markerText = createMarkerLocal ["MidPointT", getMarkerPos _midPoint];
		"MidPointT" setMarkerColorLocal "ColorBlack";
		"MidPointT" setMarkerTextLocal "The Convoy Filling Point";
		"MidPointT" setMarkerTypeLocal "mil_objective";
		_gangMembers pushBack (name player);
} forEach (units group player);
_distance = _vehicle distance (getMarkerPos _midPoint);
_distance = floor(_distance);


waitUntil {
	_distance = _vehicle distance (getMarkerPos _midPoint);
	_distance = floor(_distance);
	_distance < 30;
};
_vehicle setVariable ["convoyMid", true, true];
hint "Congratulations, you have made it half way! Fill the truck with the supplies by pressing windows key on the vehicle then make your way to the final point! However, the police may be expecting your presence, act accordingly!";
{
		deleteMarkerLocal "MidPointM";
		deleteMarkerLocal "MidPointT";
		deleteMarkerLocal "EndPointM";
		deleteMarkerLocal "EndPointT";
		_marker = createMarkerLocal ["EndPointM", getMarkerPos _endPoint];
		"EndPointM" setMarkerColorLocal "ColorRed";
		"EndPointM" setMarkerTypeLocal "Empty";
		"EndPointM" setMarkerShapeLocal "ELLIPSE";
		"EndPointM" setMarkerSizeLocal [30,30];
		_markerText = createMarkerLocal ["EndPointT", getMarkerPos _endPoint];
		"EndPointT" setMarkerColorLocal "ColorBlack";
		"EndPointT" setMarkerTextLocal "The Convoy Delivery Point";
		"EndPointT" setMarkerTypeLocal "mil_objective";
} forEach (units group player);

if (_notify < 3) then {
	{
		if(playerSide isEqualTo west) then {
			hint "Some civilian gang members have filled there convoy will illegal drugs, stop them to recive your christmass bonus early ;-), Their location has been marked on your GPS";
			deleteMarkerLocal "EndPointM";
			deleteMarkerLocal "EndPointT";
			_marker = createMarkerLocal ["EndPointM", getMarkerPos _endPoint];
			"EndPointM" setMarkerColorLocal "ColorRed";
			"EndPointM" setMarkerTypeLocal "Empty";
			"EndPointM" setMarkerShapeLocal "ELLIPSE";
			"EndPointM" setMarkerSizeLocal [30,30];
			_markerText = createMarkerLocal ["EndPointT", getMarkerPos _endPoint];
			"EndPointT" setMarkerColorLocal "ColorBlack";
			"EndPointT" setMarkerTextLocal "The Convoy Delivery Point";
			"EndPointT" setMarkerTypeLocal "mil_objective";
		};
	} forEach playableUnits;
};

_distance = _vehicle distance (getMarkerPos _endPoint);
_distance = floor(_distance);

waitUntil {
	_distance = _vehicle distance (getMarkerPos _endPoint);
	_distance = floor(_distance);
	_distance < 30;
};

hint "Well done you're at the end, just deliver(windows key) the convoy to finish! The vehicle will despawn in 1 minute, Hurry!!!";
_vehicle setVariable ["convoyFinished", true, true];
deleteMarkerLocal "EndPointM";
deleteMarkerLocal "EndPointT";

sleep 60;
deleteVehicle _vehicle;

switch (_type) do {
	case 1 : {missionNamespace setVariable ["inProgressGang1", false, true]};
	case 2 : {missionNamespace setVariable ["inProgressGang2", false, true]};
	case 3 : {missionNamespace setVariable ["inProgressGang3", false, true]};
	case 4 : {missionNamespace setVariable ["inProgressGang4", false, true]};
};
