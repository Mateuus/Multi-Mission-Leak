/* 
 File: fn_vehicleShopMenu.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Blah 
*/ 
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"]; 
 
_shop = (_this select 3) param [0,"",[""]]; 
_sideCheck = (_this select 3) param [1,sideUnknown,[civilian]]; 
_spawnPoints = (_this select 3) param [2,"",["",[]]]; 
_shopFlag = (_this select 3) param [3,"",[""]]; 
_disableBuy = (_this select 3) param [5,false,[true]]; 
 
disableSerialization; 
//Long boring series of checks 
if(dialog) exitWith {}; 
if(_shop == "") exitWith {}; 
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hint "Du darfst diesen Shop nicht benutzen!"}; 
 
if(!createDialog "LHM_don_Vehicle_Shop_v2") exitWith {}; 
 
lhm_veh_shop = [_shop,_spawnpoints,_shopFlag]; //Store it so so other parts of the system can access it. 
 
ctrlSetText [2301,((_this select 3) select 4)]; 
ctrlShow[1910,false]; 
 
if(_disableBuy) then { 
 //Disable the buy button. 
 ctrlEnable [2309,false]; 
}; 
 
//Fetch the shop config. 
_vehicleList = [_shop] call lhm_fnc_donatorvehicleListCfg; 
 
_control = ((findDisplay 2300) displayCtrl 2302); 
lbClear _control; //Flush the list. 
ctrlShow [2330,false]; 
ctrlShow [2304,false]; 
 
//Loop through 
{ 
 _className = _x select 0; 
 _basePrice = _x select 1; 
 
 _vehicleInfo = [_className] call lhm_fnc_fetchVehInfo; 
 _control lbAdd (_vehicleInfo select 3); 
 _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)]; 
 _control lbSetData [(lbSize _control)-1,_className]; 
 _control lbSetValue [(lbSize _control)-1,_ForEachIndex]; 
} foreach _vehicleList; 
 
LHM_VehShop_Showcase = true; 
 
[] spawn lhm_fnc_circleVehicleShow; 
 
waituntil {isnull (findDisplay 2300);}; 
 
LHM_VehShop_Showcase = false; 
LHM_shop_cam cameraEffect ["TERMINATE","BACK"]; 
camDestroy LHM_shop_cam; 
 
deleteVehicle LHM_shop_show_vehicle; 
deleteVehicle LHM_shop_light;