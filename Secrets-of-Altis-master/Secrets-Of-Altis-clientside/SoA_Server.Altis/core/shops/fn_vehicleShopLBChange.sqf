#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_LKW","_PKW","_PKWPlus","_checkTank"];
_control = _this select 0;
_index = _this select 1;

//Clear old vehicle
if(!isnull veh_shop_vehicle) then {
	{deletevehicle _x} foreach attachedObjects veh_shop_vehicle;
	deletevehicle veh_shop_vehicle;
}; 

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_basePrice = [_className,playerside] call life_fnc_classPrices;

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
if(_vehicleInfo isEqualTo []) exitWith {};

_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
_LKW = ["C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","I_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_fuel_F","I_Truck_02_box_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","O_Truck_03_repair_F","O_Truck_03_device_F","O_Truck_02_fuel_F","O_Truck_03_ammo_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","O_T_LSV_02_unarmed_F","B_T_LSV_01_unarmed_F"];
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

_hasApex = if(_className in ["B_T_LSV_01_unarmed_F","O_T_LSV_02_unarmed_F","C_Offroad_02_unarmed_F","C_Scooter_Transport_01_F","I_C_Boat_Transport_02_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"]) then {"Dies ist ein Apex-DLC-Inhalt! <img image='a3\ui_f\data\logos\arma3_bundle_icon_ca.paa' /><br/><br/>"} else {""};

ctrlShow [2330,true];
(getControl(2300,2303)) ctrlSetStructuredText parseText format[
_hasApex
+(localize "STR_Shop_Veh_UI_Rental")+" <t color='#8cff9b'>%1€</t><br/>
"+(localize "STR_Shop_Veh_UI_Ownership")+" <t color='#8cff9b'>%2€</t><br/>
"+(localize "STR_Shop_Veh_UI_MaxSpeed")+" %3 km/h<br/>
"+(localize "STR_Shop_Veh_UI_HPower")+" %4<br/>
"+(localize "STR_Shop_Veh_UI_PSeats")+" %5<br/>
"+(localize "STR_Shop_Veh_UI_Trunk")+" %6<br/>
"+(localize "STR_Shop_Veh_UI_Fuel")+" %7<br/>
"+"Tankt:"+" %8<br/>
"+(localize "STR_Shop_Veh_UI_Armor")+" %9
",
[_basePrice] call life_fnc_numberText,
[round(_basePrice * 1.5)] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"Keinen Kofferraum"} else {_trunkSpace},
_vehicleInfo select 12,
_checkTank,
_vehicleInfo select 9
];

_ctrl = getControl(2300,2304);
lbClear _ctrl;
_colorArray = [_className] call life_fnc_vehicleColorCfg;

for "_i" from 0 to count(_colorArray)-1 do {
	if((_colorArray select _i) select 1 == (life_veh_shop select 2)) then {
		_temp = [_className,_i] call life_fnc_vehicleColorStr;
		_ctrl lbAdd format["%1",_temp];
		_ctrl lbSetValue [(lbSize _ctrl)-1,_i];
	};
};

//place vehicle
_pos = [3020.13,12555.4,1.34629];
veh_shop_vehicle = _classname createVehicleLocal [0,0,0];
veh_shop_vehicle setpos _pos;
veh_shop_vehicle enablesimulation false;
veh_shop_vehicle allowdamage false;
veh_shop_vehicle setPilotLight true;
veh_shop_vehicle setdir 146.63;
veh_shop_vehicle setposATL _pos;

if(_className in (__GETC__(life_vShop_rentalOnly))) then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlEnable[2304,true];
} else {
	ctrlEnable[2304,false];
};
true;