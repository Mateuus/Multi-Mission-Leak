#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;

private ["_control","_index","_dataArr","_className","_vehicleColor","_vehicleInfo","_trunkSpace","_retrievePrice","__GETC__","_sellPrice","_control1","_selectedtexture","_count","_camerapos"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call lhm_fnc_vehicleColorStr;
_vehicleInfo = [_className] call lhm_fnc_fetchVehInfo;
_trunkSpace = [_className] call lhm_fnc_vehicleWeightCfg;

_retrievePrice = [_className,__GETC__(lhm_garage_prices)] call TON_fnc_index;
_sellPrice = [_className,__GETC__(lhm_garage_sell)] call TON_fnc_index;
_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(lhm_garage_prices) select _retrievePrice) select 1;};
_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(lhm_garage_sell) select _sellPrice) select 1;};

_control1 = ((findDisplay 2800) displayCtrl 2802);
if(_control1 lbData 0 == "No_Vehicles") exitWith {};


(getControl(2800,2803)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>$%1</t><br/>
	" +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>$%2</t><br/>
	" +(localize "STR_Shop_Veh_UI_Color")+ " %8<br/>
	" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>
	" +(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>
	" +(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>
	" +(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>
	" +(localize "STR_Shop_Veh_UI_Fuel")+ " %7
	",
[_retrievePrice] call lhm_fnc_numberText,
[_sellPrice] call lhm_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor
];

ctrlShow [2803,true];
ctrlShow [2830,true];


slidersetRange [1911,0,1.5];
sliderSetPosition [1911, LHM_shop_Rotate_speed];

ctrlShow[1911,true];


/////


if(!(isnil "LHM_shop_show_vehicle")) then
{
	deleteVehicle LHM_shop_show_vehicle;
};

if(!(isnil "LHM_shop_cam")) then
{
	camDestroy LHM_shop_cam;
};


LHM_shop_show_vehicle = _className createVehicleLocal [23194.8,28544,50000.861];
LHM_shop_show_vehicle setposatl [23194.8,28544,50000.861];
LHM_shop_show_vehicle enableSimulation false;
LHM_shop_show_vehicle setDir LHM_VehShop_Dir;

player action ["lightOn",  LHM_shop_show_vehicle];
player action ["CollisionLightOn", LHM_shop_show_vehicle];



_vehicleColor = [_className] call lhm_fnc_vehicleColorCfg;
if(count(_vehicleColor) != 0) then {
	_selectedtexture = _vehicleColor select (_dataArr select 1);
};

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
