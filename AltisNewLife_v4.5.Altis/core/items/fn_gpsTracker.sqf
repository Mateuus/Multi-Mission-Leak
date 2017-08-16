#include <macro.h>
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(life_inv_gpsTracker == 0) exitWith {hint "Tu as besoin d'un traceur GPS."};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Tu ne peux pas ajouter de traceur GPS sur ca"};
if(player distance _unit > 7) exitWith {hint "Tu dois etre plus pres !"};
if(!([false,"gpstracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 4;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Tu es trop loin !","PLAIN"];};
titleText["Le traceur GPS est en place !","PLAIN"];

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_Traceur_GPS",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
	if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
	_marker setMarkerPosLocal getPos _veh;
	uiSleep 0.5;
	};
};