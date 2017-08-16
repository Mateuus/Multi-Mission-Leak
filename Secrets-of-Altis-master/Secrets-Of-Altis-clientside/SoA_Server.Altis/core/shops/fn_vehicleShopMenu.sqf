/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_light","_pos"];
_shop = [(_this select 3),0,"",[""]] call BIS_fnc_param;
_sideCheck = [(_this select 3),1,sideUnknown,[civilian]] call BIS_fnc_param;
_spawnPoints = [(_this select 3),2,"",["",[]]] call BIS_fnc_param;
_shopFlag = [(_this select 3),3,"",[""]] call BIS_fnc_param;
_disableBuy = [(_this select 3),5,false,[true]] call BIS_fnc_param;

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop == "") exitWith {};
if(_sideCheck != sideUnknown && playerSide != _sideCheck) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};
if(!license_civ_ausweis && playerSide == civilian) exitWith {hint "Du benötigst deinen Personalausweis für den Abschluss des Kaufvertrages!"};
if(!license_civ_driver && playerSide == civilian) exitWith {hint "Ohne Führerschein wird hier nichts verkauft!"};
if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,((_this select 3) select 4)];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};

//Fetch the shop config.
_vehicleList = [_shop] call life_fnc_vehicleListCfg;

_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
//ctrlShow [2330,false];
ctrlEnable [2304,false];

//Loop through
{
	_className = _x;
	_basePrice = [_className,playerside] call life_fnc_classPrices;
	
	_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_className];
	_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
} foreach _vehicleList;

_control lbSetCurSel 0;

//initialize Camera
hudactive = false;
2 cutFadeOut 1;
_pos = [3020.13,12555.4,22];

_veh_shop_logic = "Logic" createVehicleLocal [0,0,0];
_veh_shop_logic setposworld _pos;
  
_radius = 18; 
_winkel = 310;
_hoehe = 16; 
_speed = 0.13;
_poscam = [_veh_shop_logic, _radius, _winkel] call BIS_fnc_relPos; 
_poscam set [2, _hoehe];

_life_vehshop_cam = "camera" camCreate _poscam; 
_life_vehshop_cam cameraEffect ["INTERNAL","BACK"]; 
_life_vehshop_cam camPrepareFOV 0.550; 
_life_vehshop_cam camPrepareTarget _veh_shop_logic; 
_life_vehshop_cam camCommitPrepared 0; 
showCinemaBorder false; 
titleCut ["", "BLACK IN",1]; 

while {!isnull(findDisplay 2300) && alive player} do { 
	_poscam = [_veh_shop_logic, _radius, _winkel] call BIS_fnc_relPos; 
	_poscam set [2, _hoehe]; 
	_life_vehshop_cam camPreparePos _poscam; 
	_life_vehshop_cam camCommitPrepared _speed; 
	waitUntil {camCommitted _life_vehshop_cam OR isnull(findDisplay 2300) OR !alive player}; 
	_life_vehshop_cam camPreparePos _poscam;
	_life_vehshop_cam camCommitPrepared 0;
	_winkel = _winkel + 1;
}; 

{deletevehicle _x} foreach attachedObjects veh_shop_vehicle;
deletevehicle _veh_shop_logic;
deletevehicle veh_shop_vehicle;
_life_vehshop_cam cameraEffect ["terminate","back"]; 
camDestroy _life_vehshop_cam;
hudactive = true;
[] call life_fnc_hudSetup;