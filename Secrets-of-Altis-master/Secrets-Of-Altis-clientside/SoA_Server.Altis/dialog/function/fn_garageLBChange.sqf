#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_price","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_LKW","_PKW","_PKWPlus","_checkTank"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_price = [_className,playerside] call life_fnc_classPrices;
_retrievePrice = if(_price == -1) then {1000} else {_price*0.01;};
_sellPrice = if(_price == -1) then {1000} else {_price/2;};

_LKW = ["C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","I_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_fuel_F","I_Truck_02_box_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","O_Truck_03_repair_F","O_Truck_03_device_F","O_Truck_02_fuel_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","O_T_LSV_02_unarmed_F","B_T_LSV_01_unarmed_F","O_Truck_03_ammo_F"];
_PKW = ["C_Quadbike_01_F","O_MRAP_02_F","I_MRAP_03_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_MRAP_01_F","C_Hatchback_01_F","C_Offroad_01_F","I_G_Offroad_01_F","B_Quadbike_01_F","C_Quadbike_01_black_F","C_Offroad_02_unarmed_F"];
_PKWPlus = ["C_SUV_01_F","C_Hatchback_01_sport_F"];

_checkTank = switch(true) do 
{
	case(_className in _LKW): {"Diesel";};
	case(_className in _PKW): {"Super";};
	case(_className in _PKWPlus): {"Super-Plus";};
	case(_className isKindOf "Air"): {"Kerosin";};
	case(_className isKindOf "Ship"): {"Heizöl";};
};

(getControl(2800,2803)) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>%1€</t><br/>
"+(localize "STR_Shop_Veh_UI_SellP")+" <t color='#8cff9b'>%2€</t><br/>
"+(localize "STR_Shop_Veh_UI_Color")+" %8<br/>
"+(localize "STR_Shop_Veh_UI_MaxSpeed")+" %3 km/h<br/>
"+(localize "STR_Shop_Veh_UI_HPower")+" %4<br/>
"+(localize "STR_Shop_Veh_UI_PSeats")+" %5<br/>
"+(localize "STR_Shop_Veh_UI_Trunk")+" %6<br/>
"+(localize "STR_Shop_Veh_UI_Fuel")+" %7<br/>
"+"Tankt:"+" %9
",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"Keinen Kofferraum"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor,
_checkTank
];

ctrlShow [2803,true];