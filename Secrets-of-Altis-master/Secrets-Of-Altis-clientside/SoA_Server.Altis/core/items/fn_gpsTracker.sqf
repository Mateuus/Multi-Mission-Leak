/*
    File: fn_gpsTracker.sqf
    Author: Poseidon
    
    Description: Attaches a gps tracker to selected vehicle
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "LandVehicle" OR _unit isKindOf "Air" OR _unit isKindOF "Ship")) exitWith {hint "Du kannst den GPS Tracker hier nicht benutzen."};
if(player distance _unit > 7) exitWith {hint "Du musst dich näher an das Fahrzeug stellen!"};
if(!([false,"gpsTracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
			{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
sleep 0.195;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Du bist nicht in der Nähe eines Fahrzeugs!","PLAIN"];};
titleText["Du hast einen GPS Tracker an diesem Fahrzeug angebracht.","PLAIN"];
sleep 4;
[_unit, "beep"] remoteExecCall ["say3D",0];

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