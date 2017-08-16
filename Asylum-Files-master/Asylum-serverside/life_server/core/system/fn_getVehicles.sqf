 
 
 
 
 
 
 
private["_pid","_side","_type","_unit","_ret","_HC","_count"]; 
_pid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_count = [_this,4,false,[false]] call BIS_fnc_param; 
_HC = false; 
 
 
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith 
{ 
if(!isNull _unit) then 
{ 
[[[]],"life_fnc_impoundMenu",(_unit),false] spawn life_fnc_MP; 
}; 
}; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
[[_pid,_side,_type,_unit],"HC_fnc_getVehicles",(owner hc_1),FALSE] spawn life_fnc_MP; 
}; 
}; 
 
if(_HC) exitWith {}; 
 
_ret = [_pid,_side,_type] call DB_fnc_queryVehicles; 
if(isNil "_ret") then {_ret = [];}; 
systemChat format["Fetching garage for %1", name _unit]; 
if (!_count) then { [[_ret],"life_fnc_impoundMenu",_unit,false] spawn life_fnc_MP; } 
else { life_veh_count = count _ret; (_unit getVariable ["ownerID", -1]) publicVariableClient "life_veh_count" };