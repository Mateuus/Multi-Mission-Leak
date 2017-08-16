/* 
    Fichier: fn_gpsTracker.sqf 
    Autheur: Poseidon / Modifié par DeathBlade 
     
    Description: Attache un GPS Tracker sur le véhicule sélectionner. 
*/ 
private["_unit","_gps","_fail"]; 
disableSerialization; 
 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_gps = _unit getVariable "vehicle_info_gps"; 
_fail = false; 
EMonkeys_vehGPS_marker = ctrlText 3304; 
 
closeDialog 0; 
 
if(vehicle player != player) exitWith {Hint "Du kannst den GPS Tracker nicht im Fahrzeug anbringen"}; 
if(isNull _unit) exitWith {}; 
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Anbringen nicht möglich."}; 
{ if((GetPlayerUID player) in _x) exitWith {_fail = true; hint "Du besitzt bereits ein GPS Tracker an diesem Fahrzeug."}; }foreach _gps; 
if (_fail) exitWith {};  
if(player distance _unit > 7) exitWith {hint "Du müssen näher an das Fahrzeug ran!"}; 
if(!([false,"gpstracker",1] call EMonkeys_fnc_handleInv)) exitWith {}; 
 
 
eM_action_inUse = true; 
player playMove "AinvPknlMstpSnonWnonDnon_medic_1"; 
uisleep 4; 
eM_action_inUse = false; 
if(player distance _unit > 7) exitWith {titleText["Du bist nicht in der Nähe eines Fahrzeugs!","PLAIN"];}; 
titleText["GPS Tracker erfolgreich montiert.","PLAIN"]; 
 
//Vehicle GPS Tracker setzen 
_gps pushBack [GetPlayerUID player,profileName,EMonkeys_vehGPS_marker]; 
_unit setVariable ["vehicle_info_gps", _gps,true];