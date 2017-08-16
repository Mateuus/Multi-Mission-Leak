/* 
 File: fn_vehicleDelete.sqf 
*/ 
private["_vid","_sp","_pid","_query","_sql","_type","_thread"]; 
_vid = param[0,-1,[0]]; 
_pid = param[1,"",[""]]; 
_sp = param[2,2500,[0]]; 
_unit = param[3,ObjNull,[ObjNull]]; 
_type = param[4,"",[""]]; 
 
if(_vid isEqualTo -1 OR _pid isEqualTo "" OR _sp == 0 OR isNull _unit OR _type isEqualTo "") exitWith {}; 
 
_query = format["updateVehicle2:%1:%2",_pid,_vid]; 
_thread = [_query,1] call zero_fnc_asyncCall; 
 
[1,[_sp,_type]] remoteExecCall ["zero_fnc_yaxyEMy",(owner _unit)]; 
