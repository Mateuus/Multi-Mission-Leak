/* 
 Author: Christian "Cifon" Runggas 
 E-mail: me@cifon.de 
*/ 
private["_uid","_name"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
 
if(_uid == "") exitWith {}; 
if(_name == "") exitWith {}; 
 
{ 
 if((_x getVariable["name","Unknown"] == _name)) then  
 { 
  _containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; 
  if(count _containers > 0) then  
  { 
   {deleteVehicle _x;} foreach _containers; 
  }; 
  deleteVehicle _x; 
 }; 
}forEach allDeadMen; 
 
_query = format["UPDATE players SET online='0' WHERE playerid='%1'", _uid]; 
[_query,1] call DB_fnc_asyncCall; 
 
_text = format ["*** Player disconnect | SpielerID: %1 |",_uid]; 
[7,_text] call TON_fnc_log;