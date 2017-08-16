 
 
 
 
 
 
 
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_ammo","_maxAmmo"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_impound = [_this,1,false,[true]] call BIS_fnc_param; 
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (_unit getVariable ["ownerID", -1]) publicVariableClient "life_impound_inuse";life_garage_store = false;(_unit getVariable ["ownerID", -1]) publicVariableClient "life_garage_store";};  
 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
_plate = _vInfo select 1; 
_uid = _vInfo select 0; 
 
_ammo = 0; 
if ((typeOf _vehicle) == "B_G_Offroad_01_armed_F") then 
{ 
_maxAmmo = 400; 
{ 
_ammo = _ammo + (_x select 1); 
} forEach (magazinesAmmoFull _vehicle); 
_ammo = _ammo / _maxAmmo; 
}; 
 
if(_impound) then 
{ 
if(count _vInfo == 0) then  
{ 
life_impound_inuse = false; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_impound_inuse"; 
deleteVehicle _vehicle; 
}  
else 
{ 
_alarm = 0; 
if ((_vInfo select 3)) then { _alarm = 1; };  
[_plate,_uid,_vehicle,0,_alarm,_ammo] call DB_fnc_updateVehicle; 
_vehicle spawn {sleep 1; deleteVehicle _this};  
life_impound_inuse = false; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_impound_inuse"; 
}; 
} 
else 
{ 
if(count _vInfo == 0) exitWith 
{ 
[[1,"This vehicle isn't a persistent vehicle."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
life_garage_store = false; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_garage_store"; 
}; 
 
if(_uid != getPlayerUID _unit) exitWith 
{ 
[[1,"This vehicle doesn't belong to you therefore you cannot store it."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
life_garage_store = false; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_garage_store"; 
}; 
_alarm = 0; 
if ((_vInfo select 3)) then { _alarm = 1; };  
[_plate,_uid,_vehicle,0,_alarm,_ammo] call DB_fnc_updateVehicle; 
_vehicle spawn {sleep 1; deleteVehicle _this};  
life_garage_store = false; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_garage_store"; 
[[1,"The vehicle has been stored in your garage."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
 
};