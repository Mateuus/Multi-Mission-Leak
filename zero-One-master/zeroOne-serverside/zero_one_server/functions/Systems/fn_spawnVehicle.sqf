/* 
 File: fn_spawnVehicle.sqf 
*/ 
private ["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_dir","_colorArray","_unit","_vInfo","_lightright","_lightleft","_price","_queryResult","_setValue","_insurance"]; 
_vid = param[0,-1,[0]]; 
_pid = param[1,"",[""]]; 
_sp = param[2,[],[[],""]]; 
_unit = param[3,objNull,[objNull]]; 
_price = param[4,0,[0]]; 
_dir = param[5,0,[0]]; 
_insurance = param[6,false,[false]]; 
_name = name _unit; 
_unit = owner _unit; 
 
if(_vid isEqualTo -1 || _pid isEqualTo "") exitWith {}; 
 
_query = format["selectVehicle2:%1:%2",_vid,_pid]; 
_queryResult = [_query,2] call zero_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith {}; 
 
_vInfo = _queryResult; 
if(isNil "_vInfo") exitWith {}; 
if(_vInfo isEqualTo []) exitWith {}; 
if(count _vInfo < 5) exitWith {}; 
 
if((_vInfo select 5) isEqualTo 0) exitWith { 
 [1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteExecCall ["zero_fnc_cpbpJzzAd",_unit]; 
}; 
 
if((_vInfo select 6) isEqualTo 1) exitWith { 
 [1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteExecCall ["zero_fnc_cpbpJzzAd",_unit]; 
}; 
 
_nearVehicles = nearestObjects[_sp,["Car","Ship","Air","B_APC_Tracked_01_CRV_F"],5]; 
 
if(count _nearVehicles > 0) exitWith { 
 [1,format[(localize "STR_Garage_SpawnPointError")]] remoteExecCall ["zero_fnc_cpbpJzzAd",_unit]; 
}; 
 
_query = format["updateVehicle:%1:%2:%3",([_insurance,0] call zero_fnc_bool),_pid,_vid]; 
[_query,1] spawn zero_fnc_asyncCall; 
 
_vehicle = (_vInfo select 2) createVehicle _sp; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle allowDamage false; 
_vehicle setPos _sp; 
_vehicle setDir _dir; 
 
[_vehicle] remoteExecCall ["zero_fnc_Iyc",_unit]; 
_vehicle lock 2; 
 
_colorArray = getArray(missionConfigFile >> "zero_CfgVehicles" >> (_vInfo select 2) >> "textures"); 
for "_i" from 0 to count(_colorArray)-1 do { 
 if(((_colorArray select _i) select 0) == (_vInfo select 8) && (_vInfo select 8) != "Default") then { 
  //_vehicle setVariable["ark_vehicle_color",(_vInfo select 8),true]; 
  _vehicle setObjectTextureGlobal [0,((_colorArray select _i) select 2) select 0]; //0 index 
  if((count ((_colorArray select _i) select 2)) >=2) then { 
   _vehicle setObjectTextureGlobal [1,((_colorArray select _i) select 2) select 1]; //has 2 entries 1 index 
  }; 
  if((count ((_colorArray select _i) select 2)) >=3) then { 
   _vehicle setObjectTextureGlobal [2,((_colorArray select _i) select 2) select 2]; //has 3 entries 2 index 
  }; 
  if((count ((_colorArray select _i) select 2)) >=4) then { 
   _vehicle setObjectTextureGlobal [3,((_colorArray select _i) select 2) select 3]; //has 3 entries 2 index 
  }; 
 }; 
}; 
 
//Set Material 
if((_vInfo select 9) != "Default") then { 
 
    switch (_vInfo select 2) do { 
  
  case "C_Offroad_02_unarmed_F": { 
   _setValue = [0]; 
  }; 
 
  case "B_T_LSV_01_armed_F": { 
   _setValue = [0,1,3]; 
  }; 
 
  case "B_T_LSV_01_unarmed_F": { 
   _setValue = [0,1,3]; 
  }; 
 
  case "O_T_LSV_02_unarmed_F": { 
   _setValue = [0,1,3]; 
  }; 
 
  case "C_Plane_Civil_01_F": { 
   _setValue = [0,1]; 
  }; 
 
  case "C_Offroad_01_F": { 
   _setValue = [0]; 
  }; 
 
  case "B_G_Offroad_01_F": { 
   _setValue = [0]; 
  }; 
 
  case "B_MRAP_01_F": { 
   _setValue = [0]; 
  }; 
 
  case "I_MRAP_03_F": { 
   _setValue = [0]; 
  }; 
 
  case "I_MRAP_03_F": { 
   _setValue = [0]; 
  }; 
 
        default { 
            _setValue = []; 
            for "_i" from 0 to (count(getArray(configfile >> "CfgVehicles" >> (_vInfo select 2) >> "hiddenSelectionsTextures")) -1) do { 
                _setValue pushBack _i; 
            }; 
        }; 
 }; 
 
    { 
        _vehicle setObjectMaterialGlobal [_x,getText(missionConfigFile >> "zero_CfgMaterials" >> (_vInfo select 9) >> "path")]; 
    } forEach  _setValue; 
}; 
_insurance = if(_insurance) then {true}else{[(_vInfo select 10),1] call zero_fnc_bool}; 
_vehicle setVariable["ZAJJeFnKJ",[[_pid,_name]],true]; 
_vehicle setVariable["cXT",_pid,true]; 
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]]; 
_vehicle setVariable["insurance",_insurance]; 
_vehicle setVariable["side",(_vInfo select 1),true]; 
_vehicle setVariable["AWHWgCAxM",false,true]; 
_vehicle enableRopeAttach false; 
_vehicle enableVehicleCargo false; 
 
[_vehicle] call zero_fnc_puM; 
 
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_G_Offroad_01_F") then { 
 [_vehicle,"reb_offroad",true] remoteExecCall ["zero_fnc_GhAAhCA",_unit]; 
}; 
 
if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then { 
 [_vehicle,"cop_offroad",true] remoteExecCall ["zero_fnc_GhAAhCA",_unit]; 
}; 
 
if((_vInfo select 1) == "med" && (_vInfo select 2) in ["C_Offroad_01_F","C_Boat_Civil_01_F"]) then { 
 [_vehicle,"med_offroad",true] remoteExecCall ["zero_fnc_GhAAhCA",_unit]; 
}; 
 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "B_MRAP_01_F") then { 
 [_vehicle,"med_hunter",true] remoteExecCall ["zero_fnc_GhAAhCA",_unit]; 
}; 
 
if((_vInfo select 1) == "cop" || (_vInfo select 1) == "med") then { 
 if(!(getArray(missionConfigFile >> "zero_CfgVehicles" >> (_vInfo select 2) >> "lightpoints") isEqualTo [])) then { 
  _vehicle setVariable["lights",false,true]; 
  _lightright = "#lightpoint" createVehicle getPosATL _vehicle; 
  _lightright attachTo [_vehicle, (getArray(missionConfigFile >> "zero_CfgVehicles" >> (_vInfo select 2) >> "lightpoints") select 0)]; 
  _lightleft = "#lightpoint" createVehicle getPosATL _vehicle; 
  _lightleft attachTo [_vehicle, (getArray(missionConfigFile >> "zero_CfgVehicles" >> (_vInfo select 2) >> "lightpoints") select 1)]; 
 }; 
}; 
 
[2,[_price]] remoteExecCall ["zero_fnc_yaxyEMy",_unit]; 
sleep 30; 
_vehicle allowDamage true; 
