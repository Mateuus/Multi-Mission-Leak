#include "..\..\macros.hpp"
/*
	File: fn_vehicleShopControl.sqf
	Author: MarkusSR1984
	
	Description:
	Tut was es soll....
*/

systemChat "### Called vehicleShopControl";

private["_className","_colorIndex","_DWEV_box_array","_camera","_ctrl"];
_className = lbData[IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN,(lbCurSel IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN)];
_colorIndex = lbValue[IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN,(lbCurSel IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN)];

if (isNil "vehicle_shop_controller_loaded") then {vehicle_shop_controller_loaded = false;};
if (isNil "vehicle_shop_controller_current_dir") then {vehicle_shop_controller_current_dir = 0;};
if (isNil "vehicle_shop_controller_cam_pos") then {vehicle_shop_controller_cam_pos = [140,45,10012];};
if (isNil "vehicle_shop_controller_cam_target") then {vehicle_shop_controller_cam_target = [138,71,10003.5];};
if (isNil "vehicle_shop_controller_center") then {vehicle_shop_controller_center = [138,71,10003.5];};
if (isNil "vehicle_shop_controller_vehicle") then {vehicle_shop_controller_vehicle = objNull;};
if (isNil "DWF_fnc_calcFov") then {DWF_fnc_calcFov = {_boundingbox = (boundingBoxReal (_this select 0));_dist = ((boundingBoxReal (_this select 0)) select 1) distance ((boundingBoxReal (_this select 0)) select 0);_fov = (_dist / 30);_fov;};};

systemChat "### vehicleShopControl -> Alle default Variablen gesetzt";

if (isNull vehicle_shop_controller_vehicle || (typeOf vehicle_shop_controller_vehicle) != _className) then 
{
	systemChat "### vehicleShopControl -> Erstelle ein neues Fahrzeug";
	if (!isNull vehicle_shop_controller_vehicle) then {deletevehicle vehicle_shop_controller_vehicle;};
	
	_vehicle = _className createVehicleLocal [0,0,999999];
	_vehicle setVariable ["mapplaced",true];
	_vehicle enableSimulation false;
	_vehicle allowDamage false;
	_vehicle setPos vehicle_shop_controller_center;
	
	systemChat format ["### vehicleShopControl -> Setze das neue Fahrzeug auf Position: %1",vehicle_shop_controller_center];
	systemChat format ["### vehicleShopControl -> prüfe die Position des Fahrzeuges	  : %1",(getPos _vehicle)];
	
	vehicle_shop_controller_vehicle = _vehicle;
};

systemChat "### vehicleShopControl -> Setze die Farbe auf das Fahrzeug";
[vehicle_shop_controller_vehicle,_colorIndex,true] spawn DWEV_fnc_colorVehicle;



if (!vehicle_shop_controller_loaded) then 
{
	_DWEV_box_array = [];
	systemChat "### vehicleShopControl -> Lade Vehicle Shop Controller";
	// Box erstellen

	{
		_tmp = (_x call DWEV_fnc_objectInit);
		_tmp setObjectTexture [0, "#(argb,512,512,1)r2t(rendersurface,1.333)"];
		_pos = [(((getPosATL _tmp)select 0) - 21000),(((getPosATL _tmp)select 1) - 5500),(((getPosATL _tmp)select 2) + 10000)];
		_tmp setPosATL _pos;
		systemChat format ["### vehicleShopControl -> Erstelle Box Item %1 auf Position %2",_tmp,_pos];
		_DWEV_box_array pushBack _tmp;
		false;
	} count (call compile preprocessFileLineNumbers "core\objects\shopBox.sqf");

	systemChat "### vehicleShopControl -> Erstelle Kamera";
	_camera = "camera" camCreate vehicle_shop_controller_cam_pos;
	_camera cameraEffect ["internal","back"];
	_camera camSetTarget vehicle_shop_controller_cam_target;
	_camera camSetFOV 1;
	_camera camSetFOV ([vehicle_shop_controller_vehicle] call DWF_fnc_calcFov);
	_camera camCommit 0;
	
	systemChat "### vehicleShopControl -> Erstelle Beleuchtung";
	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	_lightSource setLightColor [250,200,200];
	_lightSource setLightAmbient [1,1,0.2];
	_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 3500;
	_lightSource setLightUseFlare true;
	_lightSource setLightFlareSize 0.1;
	_lightSource setLightFlareMaxDistance 50;
	_lightSource lightAttachObject [_camera,[0,0,2]];
	
	
	vehicle_shop_controller_cam = _camera;
	
	[_DWEV_box_array,_camera,_lightSource] spawn
	{
		vehicle_shop_controller_loaded = true;
		systemChat "### vehicleShopControl -> vehicle Shop Controller geladen";
		_lastVehicle = 	vehicle_shop_controller_vehicle;
		_dir = 0;
	
		while {!isNull (findDisplay IDC_FAHRZEUGSHOP_MAIN)} do
		{
			if (!isNull vehicle_shop_controller_vehicle) then 
			{
				vehicle_shop_controller_vehicle setdir _dir;
			};
			
			if (_lastVehicle != vehicle_shop_controller_vehicle) then
			{
				systemChat "### vehicleShopControl -> Update FOV";
				_lastVehicle = 	vehicle_shop_controller_vehicle;
				(_this select 1) camSetFOV ([_lastVehicle] call DWF_fnc_calcFov);
				(_this select 1) camCommit 2;
							
			};
						
			_dir = (_dir + 2);
			sleep 0.03;
		};

		systemChat "### vehicleShopControl -> Lösche alle Box Items";
		{
			deleteVehicle _x;
			false
		} count (_this select 0);

		systemChat "### vehicleShopControl -> lösche das Show Fahrzeug";
		deletevehicle vehicle_shop_controller_vehicle;

		vehicle_shop_controller_loaded = false;
		systemChat "### vehicleShopControl -> lösche die Kamera";
		(_this select 1) cameraEffect ["terminate","back"];
		camDestroy (_this select 1);
		deletevehicle (_this select 2);
		DWEV_veh_shop = Nil;
		systemChat "### vehicleShopControl -> Vehicle Shop ist wieder entladen";
	};
};