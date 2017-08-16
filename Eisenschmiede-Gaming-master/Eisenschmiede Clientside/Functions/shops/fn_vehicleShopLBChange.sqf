#include "..\script_macros.hpp"
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;

_vehicleList = M_CONFIG(getArray,"CarShops",SEL(ES_veh_shop,0),"vehicles");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);

_vehicleInfo = [_className] call ES_fnc_fetchVehInfo;
_trunkSpace = [_className] call ES_fnc_vehicleWeightCfg;

deleteVehicle ES_veh_veh;
ES_veh_veh = _className createVehicleLocal [0,0,0];
ES_veh_veh setPos [10705.1,11666.5,21508.4];
ES_veh_veh enableSimulation false;

deleteVehicle ES_vShop_Light;
ES_vShop_Light = "#lightpoint" createVehicle getPos ES_veh_veh;
ES_vShop_Light setlightbrightness 0.5;
ES_vShop_Light setlightcolor [1,1,1];
ES_vShop_Light setlightambient [1,1,1];
ES_vShop_Light lightAttachObject [ES_veh_veh, [0, 1, 2]];

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +
(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
(localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
(localize "STR_Shop_Veh_UI_Armor")+ " %8",
[_basePrice] call ES_fnc_numberText,
[round(_basePrice * 1.5)] call ES_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9
];

_ctrl = CONTROL(2300,2304);
lbClear _ctrl;
_colorArray = M_CONFIG(getArray,"CfgVehicles",_className,"textures");

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	if(EQUAL(SEL(ES_veh_shop,2),_flag)) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} foreach _colorArray;

if(_className in (ES_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
	ctrlEnable [2309,false];
} else {
	if(!(ES_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;