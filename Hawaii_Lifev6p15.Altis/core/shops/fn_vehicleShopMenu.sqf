#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_shopTitle","_disableBuy","_vehcolor","_directionVehicle"];
(SEL(_this,3)) params [
	["_shop","",[""]],
	["_sideCheck",sideUnknown,[civilian]],
	["_spawnPoints","",["",[]]],
	["_shopFlag","",[""]],
	["_shopTitle","",[""]],
	["_disableBuy",false,[true]]
];

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop == "") exitWith {};
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};
if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};
_randompos = random(1000);
_pos = [1000,_randompos,10000];
_vehlogic = "Logic" createVehicleLocal _pos;
_vehlogic setPosATL _pos;

_light = "#lightpoint" createVehicleLocal [1000,_randompos,10000];
_light setLightBrightness 0.5;
_light setLightAmbient [1.0, 1.0, 1.0];
_light lightAttachObject [_vehlogic, [0,-4,4]];

life_shop_cam = "CAMERA" camCreate getPos _vehlogic;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (_vehlogic modelToWorld [0,0,0]);
life_shop_cam camSetPos (_vehlogic modelToWorld [0,25,7]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

_control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
	_className = SEL(_x,0);
	_basePrice = SEL(_x,1);
	_levelAssert = SEL(_x,3);
	_levelName = SEL(_levelAssert,0);
	_levelType = SEL(_levelAssert,1);
	_levelValue = SEL(_levelAssert,2);
	_showall = true;

	if(!(EQUAL(_levelValue,-1))) then {
		_level = GVAR_MNS _levelName;
		if(typeName _level == typeName {}) then {_level = FETCH_CONST(_level);};

		_showall = switch(_levelType) do {
			case "SCALAR": {_level >= _levelValue};
			case "BOOL": {_level};
			case "EQUAL": {EQUAL(_level,_levelValue)};
			default {false};
		};
	};

	if(_showall) then {
		_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} foreach _vehicleList;

_curVeh = "B_MRAP_01_F";
_curColor = 0;
_spVeh = "#lightpoint" createVehicleLocal [1000,_randompos,10000];
_spVeh setLightBrightness 1;
_spVeh setLightAmbient [1.0, 1.0, 1.0];
_spVeh lightAttachObject [_vehlogic, [0,0,0]];

_directionVehicle = 0;

while {!(isNull (findDisplay 2300))} do {
		if(_curVeh != lbData[2302,(lbCurSel 2302)] || _curColor != lbValue[2304,(lbCurSel 2304)]) then {
		deleteVehicle _spVeh;
		_colorIndex = lbValue[2304,(lbCurSel 2304)];
		_selVeh = lbData[2302,(lbCurSel 2302)];
		_spVeh = format["%1",_selVeh] createVehicle _pos;
		[_spVeh,_colorIndex] call life_fnc_colorVehicle;
		_spVeh attachTo [_vehlogic, [0,-4,0]];
		_directionVehicle = _directionVehicle+5;
		_spVeh setDir _directionVehicle;
		_spVeh allowDamage false;
		_curColor = _colorIndex;
		_curVeh = _selVeh;
	} else {
		_directionVehicle = _directionVehicle+1;
		_spVeh setDir _directionVehicle;
		sleep 0.03;
	};
};

waitUntil {isNull (findDisplay 2300)};
deleteVehicle _spVeh;
life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
showChat true;
