/* 
 File: fn_gpsDelete.sqf 
 Author: Niklas "Rappelkiste" Quenter 
 Contact: niklas.quenter@hotmail.de 
  
 Discription: Open Menu GPS Deleter 
*/ 
private["_unit","_display","_liste","_vehicle","_gpstracker","_fail"]; 
 
closeDialog 0; 
disableSerialization; 
 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_gpstracker = _vehicle getVariable "vehicle_info_gps"; 
_ready = false; 
 
if(isNull _vehicle) exitWith {}; 
if(!(_vehicle isKindOf "AllVehicles")) exitWith {hint "Abmontieren nicht möglich."}; 
if(vehicle player != player) exitWith {Hint "Du kannst den GPS Entferner nicht im Fahrzeug benutzen"}; 
if(player distance _vehicle > 7) exitWith {hint "Du musst näher an das Fahrzeug ran!"}; 
{ if((GetPlayerUID player) in _x) exitWith {_ready = true;}; }foreach _gpstracker; 
if (!_ready) exitWith {hint "Du besitzt keinen GPS-Tracker an diesem Fahrzeug."}; 
 
createDialog "EMonkeys_gpsScanner"; 
_display = findDisplay 38300; 
_liste = _display displayCtrl 3303; 
 
{ 
 _liste lbAdd (_x select 1); 
 _liste lbSetData [(lbSize _liste)-1,(_x select 0)]; 
}forEach _gpstracker;