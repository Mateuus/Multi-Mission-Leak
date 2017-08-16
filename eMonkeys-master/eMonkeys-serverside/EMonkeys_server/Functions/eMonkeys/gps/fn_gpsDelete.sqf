/* 
 File: fn_gpsDelete.sqf 
 Author: Niklas "Rappelkiste" Quenter 
 Contact: niklas.quenter@hotmail.de 
  
 Discription: Delete GPS Tracker from you own Vehicle 
*/ 
private["_display","_liste","_vehicle","_gpstracker","_selection"]; 
disableSerialization; 
 
_display = findDisplay 38300; 
_liste = _display displayCtrl 3303; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_gpstracker = _vehicle getVariable "vehicle_info_gps"; 
_selection = lbData [3303,(lbCurSel 3303)]; 
 
if(isNull _vehicle) exitWith {}; 
if(_selection == "") exitWith {}; 
 
if(!([false,"gpsscanner",1] call EMonkeys_fnc_handleInv)) exitWith {}; 
 
{ 
 private["_aaa","_delete"]; 
 if(_selection in _x) then { 
  _aaa = [_x]; 
  _delete = _gpstracker - _aaa; 
  _vehicle setVariable ["vehicle_info_gps", _delete,true]; 
 }; 
 
}forEach _gpstracker; 
 
closeDialog 0; 
player playMove "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
 
titleText["GPS Tracker erfolgreich demontiert","PLAIN"]; 
