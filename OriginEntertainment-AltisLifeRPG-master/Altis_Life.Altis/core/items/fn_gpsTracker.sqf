/*
	File: fn_gpsTracker.sqf
	Author: Kai
	Description: Attaches a GPS tracker to selected vehicle
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "You cannot add a GPS tracker to this."};
if(player distance _unit > 5) exitWith {hint "You need to be within 5 feet!"};
if(!([false,"gpstracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
sleep 4;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["You are not in range!","PLAIN"];};
titleText["You have attached a tracking device to this vehicle.","PLAIN"];

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_gpstracker",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
		if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
		_marker setMarkerPosLocal getPos _veh;
		sleep 0.5;
	};
};