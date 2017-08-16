#include "..\..\script_macros.hpp"
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(life_inv_traceurgps <= 0) exitWith {hint "Tu as besoin d'un traceur GPS !"};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Vous pouvez utiliser le traceur GPS uniquement sur des véhicules !"};
if(player distance _unit > 7) exitWith {hint "Approchez vous du véhicule !"};
if(!([false,"traceurgps",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Vous n'êtes pas à proximité d'un véhicule !","PLAIN"];};
titleText["Vous avez fixé un traceur GPS sur ce véhicule !","PLAIN"];

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_traceurgps",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Traceur GPS - "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
		if(not alive _veh) exitWith {deleteMarkerLocal _markerName;hint "Votre traceur GPS à été détruit.";};
		_marker setMarkerPosLocal getPos _veh;
		sleep 0.5;
	};
};