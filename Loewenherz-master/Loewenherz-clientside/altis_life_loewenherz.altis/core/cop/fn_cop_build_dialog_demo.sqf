/*
Filename: fn_cop_build_dialog_demo.sqf

Author: Barney

Description: No Description for u!

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_display","_LB_Objects","_className","_camerapos"];
if(!(playerside in [west,east])) exitWith {hint "Du bist kein Cop oder Sec!";};
disableSerialization;

_display 	 = findDisplay 2222;
//Listboxes
_LB_Objects 	 = _display displayCtrl 2302;

_className = _LB_Objects lbdata (lbCurSel _LB_Objects);

slidersetRange [1910,0,1.5];
sliderSetPosition [1910, LHM_shop_Rotate_speed];


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


LHM_shop_light = "#lightpoint" createVehicleLocal (LHM_shop_show_vehicle modelToWorld [15,5,3]);
LHM_shop_light setLightBrightness 1;
LHM_shop_light setLightAmbient[0.7, 0.7, 0.7];
LHM_shop_light setLightColor[1.0, 1.0, 1.0];

LHM_shop_cam = "CAMERA" camCreate getPosatl (LHM_shop_show_vehicle);
showCinemaBorder false;
LHM_shop_cam cameraEffect ["Internal", "Back"];
LHM_shop_cam camSetPos (LHM_shop_show_vehicle modelToWorld [30,5,3]);
LHM_shop_cam camSetTarget LHM_shop_show_vehicle;
//LHM_shop_cam camSetFocus [50, 0];
//LHM_shop_cam camSetFOV .35;
LHM_shop_cam camCommit 0;


