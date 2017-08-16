#include "..\script_macros.hpp"
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_shopTitle","_disableBuy"];
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
if(!createDialog "ES_Vehicle_Shop_v2") exitWith {};

ES_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};

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
		_level = missionNamespace getVariable _levelName;
		if(typeName _level == typeName {}) then {_level = FETCH_CONST(_level);};

		_showall = switch(_levelType) do {
			case "SCALAR": {_level >= _levelValue};
			case "BOOL": {_level};
			default {false};
		};
	};

	if(_showall) then {
		_vehicleInfo = [_className] call ES_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} foreach _vehicleList;

ES_veh_veh=objNull;
ES_vShop_Light=objNull;
{if(_x!=ES_veh_veh)then{_x hideObject true}}forEach entities"Car";
_control lbSetCurSel 0;
ES_veh_cam = "CAMERA" camCreate getPos player;
ES_veh_cam setDir 208.405;
showCinemaBorder false;
ES_veh_cam cameraEffect ["Internal", "Back"];
ES_veh_cam camSetTarget ES_camtarget;
if (CurrentMode == "Altis") then {
	ES_veh_cam camSetPos [10705.7,11675.3,21513.1];
}else{
	ES_veh_cam camSetPos [10704.7,11677.3,21522.1];
};
ES_veh_cam camSetFOV .75;
ES_veh_cam camSetFocus [50, 0];
ES_veh_cam camCommit 0;
[]spawn{while{!isNull(finddisplay 2300)}do{ES_veh_veh setDir ((direction ES_veh_veh)+0.1);sleep 0.001}};
[]spawn{
    waitUntil{isNull(finddisplay 2300)};
    {_x hideObject false}forEach entities"Car";
    ES_veh_cam cameraEffect ["TERMINATE","BACK"];
    camDestroy ES_veh_cam;
    deleteVehicle ES_veh_veh;
    deleteVehicle ES_vShop_Light;
};