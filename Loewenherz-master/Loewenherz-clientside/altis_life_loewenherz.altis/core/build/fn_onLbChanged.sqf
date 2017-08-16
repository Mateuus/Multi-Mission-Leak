/*
	File: fn_onLbChanged.sqf
	Author: Mario2002

	Description:
	init the builder menu
*/


private ["_control","_index","_dialog","_lbFilter","_indexFilter","_lb","_data","_dataOk","_buybutton","_classname","_cfg","_objects","_information","_camerapos"];
disableSerialization;

_control = _this select 0;
_index = _this select 1;
_dialog = findDisplay 8800;
_lbFilter = findDisplay 8803;
_indexFilter = lbCurSel 8803;
_lb = _dialog displayCtrl 8802;
_index = lbCurSel _lb;
_data = _lb lbData _index;
_data = (call compile _data);
_dataOk = _data select 1;
_data = _data select 0;
_buybutton = _dialog displayCtrl 8810;
if(_dataOk) then {
	_buybutton ctrlEnable true;
} else {
	_buybutton ctrlEnable false;
};


if (_index == -1) exitWith {hint "Objekt auswaehlen!"};


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

slidersetRange [1910,0,1.5];
sliderSetPosition [1910, LHM_shop_Rotate_speed];


LHM_shop_show_vehicle = _data createVehicleLocal [23194.8,28544,50000.861];
LHM_shop_show_vehicle setposatl [23194.8,28544,50000.861];
LHM_shop_show_vehicle enableSimulation false;
LHM_shop_show_vehicle setDir LHM_VehShop_Dir;



_cfg = [] call build_fnc_config;
_objects = [(_cfg select _indexFilter)] call build_fnc_objects;

_information = _dialog displayCtrl 8804;

_information ctrlSetStructuredText parseText format[
	"Price: <t color='#8cff9b'>$%1</t><br/>Gang Account: <t color='#8cff9b'>$%7</t><br/><br/>Weaponstorage: %2<br/>Itemstorage: %3<br/>Permanent: %4<br/>Type: %5<br/>Description: %6<br/>",
	[(_objects select _index) select 1] call lhm_fnc_numberText,
	[(_objects select _index) select 2] call lhm_fnc_numberText,
	[(_objects select _index) select 3] call lhm_fnc_numberText,
	format ["%1", ((_objects select _index) select 4)],
	format ["%1", ((_objects select _index) select 5)],
	format ["%1", ((_objects select _index) select 6)],
	[(group player getVariable "gang_bank")] call lhm_fnc_numberText
];



LHM_shop_light = "#lightpoint" createVehicleLocal (LHM_shop_show_vehicle modelToWorld [15,5,3]);
LHM_shop_light setLightBrightness 1;
LHM_shop_light setLightAmbient[0.7, 0.7, 0.7];
LHM_shop_light setLightColor[1.0, 1.0, 1.0];

LHM_shop_cam = "CAMERA" camCreate getPosatl (LHM_shop_show_vehicle);
showCinemaBorder false;
LHM_shop_cam cameraEffect ["Internal", "Back"];
LHM_shop_cam camSetPos (LHM_shop_show_vehicle modelToWorld [30,5,3]);
LHM_shop_cam camSetTarget LHM_shop_show_vehicle;
LHM_shop_cam camSetFocus [50, 0];
LHM_shop_cam camSetFOV .35;
LHM_shop_cam camCommit 0;
