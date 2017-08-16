private["_vid","_sp","_pid","_vehicledata","_sql","_vehicle","_nearVehicles","_name","_side","_updatevehicle","_dir","_servIndex"]; 
_vid = [_this,0,-1,[0]] call BIS_fnc_param; 
_pid = [_this,1,"",[""]] call BIS_fnc_param; 
_sp = [_this,2,[],[[],""]] call BIS_fnc_param; 
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_dir = [_this,4,0,[0]] call BIS_fnc_param; 
_spawntext = _this select 5; 
_name = name _unit; 
_side = side _unit; 
_unit = owner _unit; 
 
if(_vid == -1 OR _pid == "") exitWith {}; 
 
_vehicledata = format["SELECT id, side, classname, type, pid, alive, active, plate, color, fuel, inventory, tuning, tuningcolor, price, lagerraum, geheimfach FROM vehicles WHERE id = '%1' AND pid = '%2'",_vid,_pid]; 
_vehicledata = [_vehicledata,2] call SERVERDATABASE_fnc_asyncCall; 
 
if(typeName _vehicledata == typeName "") exitWith {}; 
 
if(isNil "_vehicledata") exitWith {}; 
if(count _vehicledata == 0) exitWith {}; 
 
if((_vehicledata select 5) == 0) exitWith { 
[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vehicledata select 2]] remoteExecCall ["NETWORK_fnc_broadcast",_unit]; 
}; 
 
if((_vehicledata select 6) == 1) exitWith { 
[1,format[(localize "STR_Garage_SQLError_Active"),_vehicledata select 2]] remoteExecCall ["NETWORK_fnc_broadcast",_unit]; 
}; 
 
_updatevehicle = format ["UPDATE vehicles SET active = '1', impound = '1' WHERE pid = '%1' AND id = '%2'",_pid,_vid];  
_updatevehicle = [_updatevehicle,1] call SERVERDATABASE_fnc_asyncCall; 
 
_trunk = _vehicledata select 10; 
_geheimfach = _vehicledata select 15; 
_tuning = _vehicledata select 11; 
_tuningcolor = _vehicledata select 12; 
_tuninglagerraum = _tuning select 8; 
_uid = _vehicledata select 4; 
_plate = _vehicledata select 7; 
if (_tuninglagerraum == -1) then {_tuninglagerraum = 0;}; 
_lagerraumdb = _vehicledata select 14; 
_lagerraum = _lagerraumdb + _tuninglagerraum; 
_vehicle = createVehicle [(_vehicledata select 2),_sp,[],0,"NONE"]; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle allowDamage false; 
_vehicle setPosATL _sp; 
_vehicle setVectorUp (surfaceNormal _sp); 
_vehicle setDir _dir; 
[_vehicle] remoteExecCall ["CLIENT_fnc_addVehicle2Chain",_unit]; 
[_pid,_side,_vehicle,1] call SERVER_fnc_keyManagement; 
_vehicle lock 2; 
 
_vehicle setVariable["tuningcolor",_tuningcolor,true]; 
[_vehicle,_vehicledata select 8] remoteExecCall ["CLIENT_fnc_colorVehicle",_unit]; 
_fuel = _vehicledata select 9; 
_vehicle setFuel _fuel; 
_vehicle setVariable["jobboerse_distanz",0,true]; 
_vehicle setVariable["jobboerse","",true]; 
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true]; 
_vehicle setVariable["dbInfo",[_pid,_plate],true]; 
_vehicle setVariable["createdCheck",(_vehicledata select 1),true]; 
_vehicle setVariable["Trunk",_trunk,true]; 
_vehicle setVariable["tuning",_tuning,true]; 
_vehicle setVariable["Price",(_vehicledata select 13), true]; 
_vehicle setVariable["Lagerraum",_lagerraum, true]; 
_vehicle setVariable["Geheimfach",_geheimfach,true]; 
[_vehicle] remoteExecCall ["CLIENT_fnc_clearVehicleAmmo",_vehicle]; 
 
if ((_vehicledata select 2) != "I_MRAP_03_F") then { 
_vehicle disableTIEquipment true; 
}; 
 
_cartuning = _vehicle getVariable ["tuning","FAILED"]; 
_turbolader = _cartuning select 3; 
if(_turbolader == 1) then { 
(_vehicle)setMass(((getMass(_vehicle)))-(((getMass(_vehicle)))*0.5)); 
};  
 
_veh = typeOf _vehicle; 
if(_veh in ["C_Offroad_01_F","I_Truck_02_transport_F","B_Truck_01_transport_F"]) then 
{ 
_vehicle setVariable ["mullSlot",0,true]; 
}; 
 
if((_vehicledata select 1) == "cop") then { 
_vehicle setVariable["lights",false,true]; 
_vehicle setVariable ["side","cop",true]; 
_vehicle animate ["HidePolice", 0]; 
_vehicle animate ["HideBumper1", 0]; 
}; 
 
if((_vehicledata select 1) == "MED") then { 
_vehicle setVariable["lights",false,true]; 
_vehicle setVariable ["side","med",true]; 
_vehicle animate ["HidePolice", 0]; 
}; 
 
if((_vehicledata select 1) == "ABAC") then { 
_vehicle setVariable["lights",false,true]; 
_vehicle setVariable ["side","med",true]; 
_vehicle animate ["HideServices", 0]; 
}; 
 
[1,_spawntext] remoteExecCall ["NETWORK_fnc_broadcast",_unit]; 
 
sleep 2; 
_vehicle allowDamage true;