#include <macro.h> 
/* 
 File: fn_vehicleShopLBChange.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Called when a new selection is made in the list box and 
 displays various bits of information about the vehicle. 
*/ 
disableSerialization; 
 
private ["_control","_index","_className","_vIndex","_vehicleList","_basePrice","_vehicleInfo","_trunkSpace","_ctrl","_colorArray","_temp","__GETC__","_faction","_colorindex","_texture","_whatsit","_selectedtexture","_count","_camerapos"]; 
_control = _this select 0; 
_index = _this select 1; 
 
//Fetch some information. 
_className = _control lbData _index; 
_vIndex = _control lbValue _index; 
_vehicleList = [lhm_veh_shop select 0] call lhm_fnc_donatorvehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1; 
_vehicleInfo = [_className] call lhm_fnc_fetchVehInfo; 
_trunkSpace = [_className] call lhm_fnc_vehicleWeightCfg; 
 
ctrlShow [2330,true]; 
(getControl(2300,2303)) ctrlSetStructuredText parseText format[ 
(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +(localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +(localize "STR_Shop_Veh_UI_Armor")+ " %8", 
[_basePrice] call lhm_fnc_numberText, 
[round(_basePrice * 1.5)] call lhm_fnc_numberText, 
_vehicleInfo select 8, 
_vehicleInfo select 11, 
_vehicleInfo select 10, 
if(_trunkSpace == -1) then {"None"} else {_trunkSpace}, 
_vehicleInfo select 12, 
_vehicleInfo select 9 
]; 
 
_ctrl = getControl(2300,2304); 
lbClear _ctrl; 
 
_colorArray = [_className] call lhm_fnc_vehicleColorCfg; 
 
for "_i" from 0 to count(_colorArray)-1 do { 
 if((_colorArray select _i) select 1 == (lhm_veh_shop select 2)) then { 
  _temp = [_className,_i] call lhm_fnc_vehicleColorStr; 
  _ctrl lbAdd format["%1",_temp]; 
  _ctrl lbSetValue [(lbSize _ctrl)-1,_i]; 
 }; 
}; 
 
if(_className in (__GETC__(lhm_vShop_rentalOnly))) then { 
 ctrlEnable [2309,false]; 
} else { 
 if(!(lhm_veh_shop select 3)) then { 
  ctrlEnable [2309,true]; 
 }; 
}; 
 
 
slidersetRange [1910,0,1.5]; 
sliderSetPosition [1910, LHM_shop_Rotate_speed]; 
 
ctrlShow[1910,true]; 
 
 
 
 
lbSetCurSel[2304,0]; 
if((lbSize _ctrl)-1 != -1) then { 
 ctrlShow[2304,true]; 
} else { 
 ctrlShow[2304,false]; 
}; 
 
 
if(!(isnil "LHM_shop_show_vehicle")) then 
{ 
 deleteVehicle LHM_shop_show_vehicle; 
}; 
 
if(!(isnil "LHM_shop_cam")) then 
{ 
 camDestroy LHM_shop_cam; 
}; 
 
if(!(isnil "LHM_shop_light")) then 
{ 
 deleteVehicle LHM_shop_light; 
}; 
 
 
LHM_shop_show_vehicle = _className createVehicleLocal [23194.8,28544,50000.861]; 
LHM_shop_show_vehicle setposatl [23194.8,28544,50000.861]; 
LHM_shop_show_vehicle enableSimulation false; 
LHM_shop_show_vehicle setDir LHM_VehShop_Dir; 
 
player action ["lightOn",  LHM_shop_show_vehicle]; 
player action ["CollisionLightOn", LHM_shop_show_vehicle]; 
 
 
 
 
_faction = lhm_veh_shop select 2; 
 
 
_colorindex = lbValue[2304,(lbCurSel 2304)]; 
 
 
_texture = [_className] call lhm_fnc_vehicleColorCfg; 
 
_whatsit = lhm_veh_shop select 2; 
 
 
 
_selectedtexture = _texture select _colorindex; 
 
_count = count(_selectedtexture); 
 
if(_count == 2) then { 
 LHM_shop_show_vehicle setObjectTexture [0,(_selectedtexture select 0)]; 
}; 
 
if(_count == 3) then { 
 LHM_shop_show_vehicle setObjectTexture [0,(_selectedtexture select 0)]; 
 LHM_shop_show_vehicle setObjectTexture [1,(_selectedtexture select 2)]; 
}; 
 
if(_count == 4) then { 
 LHM_shop_show_vehicle setObjectTexture [0,(_selectedtexture select 0)]; 
 LHM_shop_show_vehicle setObjectTexture [1,(_selectedtexture select 2)]; 
 LHM_shop_show_vehicle setObjectTexture [2,(_selectedtexture select 3)]; 
}; 
 
 
 
_camerapos = [_className] call lhm_fnc_VehShopCameraConfig; 
 
 
LHM_shop_light = "#lightpoint" createVehicleLocal (LHM_shop_show_vehicle modelToWorld (_camerapos select 0)); 
LHM_shop_light setLightBrightness 1; 
LHM_shop_light setLightAmbient[0.7, 0.7, 0.7]; 
LHM_shop_light setLightColor[1.0, 1.0, 1.0]; 
 
LHM_shop_cam = "CAMERA" camCreate getPosatl (LHM_shop_show_vehicle); 
showCinemaBorder false; 
LHM_shop_cam cameraEffect ["Internal", "Back"]; 
LHM_shop_cam camSetPos (LHM_shop_show_vehicle modelToWorld (_camerapos select 0)); 
LHM_shop_cam camSetTarget (LHM_shop_show_vehicle modelToWorld (_camerapos select 1)); 
LHM_shop_cam camSetFocus [50, 0]; 
LHM_shop_cam camSetFOV .35; 
LHM_shop_cam camCommit 0; 
 
 
 
 
true;