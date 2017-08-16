/* 
 File: fn_clientDisconnect.sqf 
*/ 
private["_unit","_id","_uid","_name","_pid","_containers"]; 
_unit = param[0,objNull,[objNull]]; 
_id = param[1,-1,[-1]]; 
_uid = param[2,"",[""]]; 
_name = param[3,"",[""]]; 
if (_name isequalto "headlessclient") then {HC1_on = false;}; 
 
{ 
 _pid = _x getVariable["fXFuzosIc",""]; 
 if(_name == _pid OR _pid isEqualTo "" OR owner _x < 3) then { 
  removeAllContainers _x; 
  _containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; 
  {deleteVehicle _x;} foreach _containers; 
  deleteVehicle _x; 
 } 
} foreach allDeadMen; 
 
{ 
 _pid = getPlayerUID _x; 
 if(_uid == _pid OR _pid == "" OR owner _x < 3) then { 
  removeAllContainers _x; 
  _containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; 
  {deleteVehicle _x;} foreach _containers; 
  deleteVehicle _x; 
 } 
} foreach playableUnits; 
 
[_name] spawn { 
 params ["_name"]; 
 Player_Combat pushback _name; 
 uisleep 30; 
 Player_Combat deleteAt (Player_Combat find _name); 
}; 
deleteVehicle _unit; 
false; 
