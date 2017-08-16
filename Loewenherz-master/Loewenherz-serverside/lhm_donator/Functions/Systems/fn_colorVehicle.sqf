/* 
 File: fn_colorVehicle.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Reskins the vehicle 
*/ 
private["_vehicle","_index","_texture","_texture2","_texture3","_className"]; 
params [ 
    ["_vehicle",objNull,[objNull]], 
    ["_index",-1,[0]] 
]; 
 
_className = typeOf _vehicle; 
 
if (isNull _vehicle || !alive _vehicle || _index isEqualTo -1) exitWith {}; 
//Does the vehicle already have random styles? Halt till it's set. 
 
if(local _vehicle) then { 
 switch _className do { 
  case "C_Offroad_01_F": {[[_vehicle,"color",3,true],"TON_fnc_setObjVar",false,false] call lhm_fnc_mp;}; 
  case "C_Hatchback_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] call lhm_fnc_mp;}; 
  case "C_Hatchback_01_sport_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] call lhm_fnc_mp;}; 
  case "C_SUV_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] call lhm_fnc_mp;}; 
  case "C_Van_01_box_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] call lhm_fnc_mp;}; 
  case "C_Van_01_transport_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] call lhm_fnc_mp;}; 
 }; 
}; 
 
//Fetch texture from our present array. 
_texture = [(typeOf _vehicle)] call lhm_fnc_vehicleColorCfg; 
if (isNil "_texture" || {count _texture isEqualTo 0}) exitWith {}; 
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;}; 
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;}; 
if(count (_texture select _index) > 4) then {_material = (_texture select _index) select 4;}; 
_texture = _texture select _index; 
if(_texture isEqualType []) then { _texture = _texture select 0;}; 
 
_vehicle setVariable["lhm_VEH_color",_index,true]; 
 
//waitUntil{!isNil {_vehicle getVariable "lhm_VEH_color"}}; 
 
_vehicle setObjectTextureGlobal[0,_texture]; 
if(!isNil "_texture2") then 
{ 
 _vehicle setObjectTextureGlobal[1,_texture2]; 
}; 
if(!isNil "_texture3") then 
{ 
 _vehicle setObjectTextureGlobal[2,_texture3]; 
}; 
if(!isNil "_material") then 
{ 
 _vehicle setObjectMaterial[0,_material]; 
}; 
 
if(typeOf _vehicle isEqualTo "C_Offroad_01_F") then 
{ 
 if(_index < 5) then 
 { 
  _vehicle setObjectTextureGlobal[1,_texture]; 
 }; 
};