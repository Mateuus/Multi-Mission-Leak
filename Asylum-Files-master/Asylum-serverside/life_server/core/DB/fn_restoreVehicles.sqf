 
 
 
 
 
 
 
_pageNo = 0; 
 
while {true} do 
{  
_mem = []; 
_query = format["SELECT * FROM vehicle_mem ORDER BY plate LIMIT %1,20",(_pageNo * 20)]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(!isNil {((_result select 0) select 0)}) then { _mem = (_result select 0); }; 
_pageNo = _pageNo + 1; 
 
{ 
_vInfo = []; 
_plate = parseNumber(_x select 0); 
_class = _x select 8; 
_pos = [(_x select 1)] call DB_fnc_mresToArray; 
_pos = call compile format["%1", _pos]; 
_dir = parseNumber(_x select 2); 
_inventory = [(_x select 3)] call DB_fnc_mresToArray; 
_inventory = call compile format["%1", _inventory]; 
_owners = [(_x select 4)] call DB_fnc_mresToArray; 
_owners = call compile format["%1", _owners]; 
_dbInfo = [(_x select 5)] call DB_fnc_mresToArray; 
_dbInfo = call compile format["%1", _dbInfo]; 
if (!isNil "_dbInfo") then 
{ 
_fuel = (parseNumber(_x select 6) / 100); 
_damage = (parseNumber(_x select 7) / 100); 
_insured = [(parseNumber format["%1",(_x select 9)]),1] call DB_fnc_bool; 
 
_query = format["SELECT * FROM %2 WHERE plate='%1'",_plate,srv_table_vehicles]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; 
_result = call compile format["%1", _result]; 
if(!isNil {((_result select 0) select 0)}) then 
{ 
_vInfo = (_result select 0) select 0; 
_plate = (call compile format["%1", _vInfo select 7]); 
_alarm = (call compile format["%1", _vInfo select 12]); 
if (_class == "") then { _class = _vInfo select 2; }; 
_vehicle = _class createVehicle (_pos); 
_vehicle setPos _pos; 
_vehicle setDir _dir; 
_vehicle setVariable["vehicle_info_owners",_owners,true]; 
if(typeName (_dbInfo select 2) == "STRING") then {_dbInfo set[2,objnull]}; 
_vehicle setVariable["dbInfo",_dbInfo,true]; 
_vehicle setVariable["idleTime",1]; 
_vehicle setVariable["insured",_insured]; 
_vehicle setFuel _fuel; 
_vehicle setDamage _damage; 
_vehicle addEventHandler["Killed","_this spawn ASY_fnc_vehicleDead"]; 
_vehicle addEventHandler["GetOut", "_this call life_fnc_vehicleExit"]; 
_vehicle addEventHandler["handleDamage","_this call life_fnc_handleVehicleDamage"]; 
[_vehicle] call life_fnc_clearVehicleAmmo; 
[_vehicle] spawn ASY_fnc_igiInit; 
_vehicle lock 2; 
_vehicle enableRopeAttach false; 
 
_vehicle setVariable ["Trunk",_inventory,true]; 
 
 
[[_vehicle,(call compile format["%1",_vInfo select 8])],"life_fnc_colorVehicle",true,false] spawn BIS_fnc_MP; 
 
 
if((_vInfo select 1) == "civ" && (call compile format["%1",_vInfo select 8]) != 13 && (_vInfo select 2) in ["B_Heli_Light_01_F","C_Heli_Light_01_civil_F"]) then 
{ 
[_vehicle,"civ_littlebird",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "civ" && (call compile format["%1",_vInfo select 8]) == 13 && (_vInfo select 2) == "B_Heli_Light_01_F") then 
{ 
[_vehicle,"reb_littlebird",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "C_Offroad_01_F") then 
{ 
[_vehicle,"civ_offroad",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_G_Offroad_01_armed_F"]) then 
{ 
[_vehicle,"cop_offroad",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "cop" && (_vInfo select 2) == "C_SUV_01_F") then 
{ 
[_vehicle,"cop_suv",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "cop" && (_vInfo select 2) == "C_Hatchback_01_sport_F") then 
{ 
[_vehicle,"cop_sport",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "cop" && (_vInfo select 2) == "B_MRAP_01_F") then 
{ 
[_vehicle,"cop_hunter",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "cop" && (_vInfo select 2) == "I_Plane_Fighter_03_CAS_F") then 
{ 
[_vehicle,"cop_buzzard",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then 
{ 
[_vehicle,"med_offroad",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_SUV_01_F") then 
{ 
[_vehicle,"med_suv",true] call life_fnc_vehicleAnimate; 
}; 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "B_Heli_Light_01_F") then 
{ 
[_vehicle,"med_littlebird",true] call life_fnc_vehicleAnimate; 
}; 
 
[_plate,_dbInfo select 0,_vehicle,1,_alarm] spawn DB_fnc_updateVehicle;  
}; 
}; 
} foreach _mem; 
if ((count _mem) < 20) exitWith {}; 
}; 
 
sleep 300; 
_query = "DELETE FROM `vehicle_mem`"; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance];