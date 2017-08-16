#include "..\script_macros.hpp"

private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Du kannst den GPS Tracker hier nicht benutzen."};
if(player distance _unit >7) exitWith {hint "Du musst dich näher an das Fahrzeug stellen!"};
if(!([false,"gpstracker",1] call ES_fnc_handleInv)) exitWith {};

closeDialog 0;

ES_action_inUse = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";

sleep 4;

ES_action_inUse = false;

if(player distance _unit >7) exitWith {titleText["Du bist nicht in der Nähe eines Fahrzeugs!","PLAIN"];};
titleText["Du hast einen GPS Tracker an diesem Fahrzeug angebracht.","PLAIN"];

[_unit] spawn {
    _veh = _this select 0;
	_veh = _this select 0;
    _markerName = format["%1_gpstracker",_veh];
    _marker = createMarkerLocal [_markerName, visiblePosition _veh];
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "Mil_dot";
    _marker setMarkerTextLocal "Peilsender "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
    _marker setMarkerPosLocal getPos _veh;
    while {true} do {
        if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
        _marker setMarkerPosLocal getPos _veh;
        sleep 0.5;
    };
};