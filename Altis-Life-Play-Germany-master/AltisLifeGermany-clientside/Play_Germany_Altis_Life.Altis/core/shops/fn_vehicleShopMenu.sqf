#include <macro.h>
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"];
_shop = [(_this select 3),0,"",[""]] call BIS_fnc_param;
_sideCheck = [(_this select 3),1,sideUnknown,[civilian]] call BIS_fnc_param;
_spawnPoints = [(_this select 3),2,"",["",[]]] call BIS_fnc_param;
_shopFlag = [(_this select 3),3,"",[""]] call BIS_fnc_param;
_disableBuy = [(_this select 3),5,false,[true]] call BIS_fnc_param;

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop == "") exitWith {};
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};
if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,((_this select 3) select 4)];
ctrlSetText [2309,localize "STR_Global_Buy"];
ctrlSetText [2308,localize "STR_Global_RentVeh"];

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
	_levelData = SEL(_x,3);
	_passOver = false;
	
	if(!isNil "_levelData") then {
		_var = GVAR_MNS (SEL(_levelData,0));
		if (!isNil "_var") then {
			if (!(FETCH_CONST(_var) >= (SEL(_levelData,1)))) then {_passOver = true;};
		};
	};
	
	if(!_passOver) then {
		_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} foreach _vehicleList;

//set up the enviroment
_oldDir = getDir player;
_oldPos = visiblePositionASL player;
PG_vShop_logic = "Land_Pier_Box_F" createVehicleLocal PG_vShop_sPos;
PG_vShop_logic setPosATL PG_vShop_sPos;
_light = "#lightpoint" createVehicleLocal [1000,1000,10000];   
_light setLightBrightness 1;  
_light setLightAmbient [1.0, 1.0, 1.0];
_light lightAttachObject [PG_vShop_logic, [2,5,30]];

{_x hideObject true;} foreach playableUnits;
player attachTo [PG_vShop_logic,[100,10,0]];
player switchMove "";


//initialize camera view
PG_vShop_cam = "CAMERA" camCreate PG_vShop_sPos;
showCinemaBorder false;
PG_vShop_cam cameraEffect ["Internal", "Back"];
PG_vShop_cam camSetTarget (PG_vShop_logic modelToWorld [0,0,25]);
PG_vShop_cam camSetPos (PG_vShop_logic modelToWorld [5,11,30]);
PG_vShop_cam camSetFOV .5;
PG_vShop_cam camSetFocus [50, 0];
PG_vShop_cam camCommit 0;


//Cleanup
waitUntil {isNull (findDisplay 2300)};
{_x hideObject false;} foreach playableUnits;
detach player;
player setPosASL _oldPos;
player setDir _oldDir;
{deleteVehicle _x;} foreach [PG_vShop_logic,PG_vShop_veh];
PG_vShop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy PG_vShop_cam;

