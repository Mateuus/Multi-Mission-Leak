/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming

Description: Does the active repaint man....read the title!
*/
private["_index","_veh","_color_index"];
if(!isNull (findDisplay 2300)) then {
_veh = nearestObject [position player, "LandVehicle"];
_colorindex = lbValue[2303,(lbcursel 2303)];
closeDialog 0;

_baseprice = 12500;
_vehicleData = _veh getVariable["vehicle_info_owners",[]];
_vehOwner = (_vehicleData select 0) select 0;
if(life_beatgeld < _basePrice) exitWith {hint "Du hast keine 12.500€ um den Lackierer zu bezahlen."};

if(isNil {_vehicleData}) exitWith {hint "Es gibt keine Infos zu diesem Fahrzeug, es ist entweder gemietet oder gecheated."};
if ((getPlayerUID player) != _vehOwner) exitWith {hint "Du bist nicht der Besitzer des Fahrzeugs das lackiert werden soll."};

life_action_inUse = true;

[player,"spraycan"] remoteExecCall ["say3D",0];

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");

_sleep = 0.195;
_cP = 0.01;
_upp = format["Lackiere %1",_displayName];

_handle = [_upp,_sleep,_cP,"AinvPknlMstpsnonWnonDnon_medic_1",nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

life_action_inUse = false;
if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen!","PLAIN"]; life_action_inUse = false;};
if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es lackieren zu können!","PLAIN"];};

life_beatgeld = life_beatgeld - _basePrice;
//Send toDB
[_veh,_colorindex] remoteExecCall ["SOA_fnc_vehicleRepaint",2];

//Color vehicle locally
[_veh,_colorindex] call life_fnc_colorVehicle;
_colorVeh = [(typeOf _veh),_colorindex] call life_fnc_vehicleColorStr;
[] call SOCK_fnc_updateRequest;

hint format["Neue Farbe: %1",_colorVeh];
sleep 6;
hint "Parke das Auto in die Garage und danach wieder aus, damit es andere Spieler ebenfalls sehen können!";

};