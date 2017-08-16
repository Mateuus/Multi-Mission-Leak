#include "..\..\script_macros.hpp"
/*
    File: fn_garageLBChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_classNameLife","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellMultiplier","_price","_storageFee","_purchasePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format["%1",_dataArr];
_className = (_dataArr select 0);
_classNameLife = _className;

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleColor = ((M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures") select (_dataArr select 1)) select 0);
if (isNil "_vehicleColor") then {_vehicleColor = "Default";};

//_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
//_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");

switch (playerSide) do {
    case civilian: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
        _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
    };
    case west: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
        _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
    };
    case independent: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
        _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
    };
    case east: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
        _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
    };
};
_retrievePrice = _purchasePrice * _storageFee;
_sellPrice = _purchasePrice * _sellMultiplier;

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 1000;};
if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 1000;};

if ([life_currentExpPerks, "privategarage"] call mav_ttm_fnc_hasPerk) then {
    //_price = round(_price * 1.00);
    _retrievePrice = 500;
};

//Should be slightly faster
_vehicleConfig = configFile >> "CfgVehicles" >> _className;
_maxSpeed = getNumber (_vehicleConfig >> "maxSpeed");
_fuelCapacity = getNumber (_vehicleConfig >> "maxSpeed");
_armorRating = getNumber(_vehicleConfig >> "armor");
_trunkCapacity = [_className] call life_fnc_vehicleWeightCfg;

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>$%1</t><br/>
	" +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>$%2</t><br/>
	" +(localize "STR_Shop_Veh_UI_Color")+ " %3<br/>
	",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
_vehicleColor
];

_vehicleStats = [];
_vehicleStats pushBack ["Max Speed", format["%1km/h", _maxSpeed], _maxSpeed/1059];
_vehicleStats pushBack ["Trunk Capacity", format["%1", _trunkCapacity], _trunkCapacity/600];
_vehicleStats pushBack ["Armor",format["%1", _armorRating], _armorRating/5000];
_vehicleStats pushBack ["Fuel Tank", format["%1l", _fuelCapacity], _fuelCapacity/4500];
	
_controlStartID = 2810;
{

	CONTROL(2800,_controlStartID) progressSetPosition (_x select 2);
	CONTROL(2800,_controlStartID + 1) ctrlSetStructuredText parseText format ["<t align = 'left'>%1</t><t align = 'right'>%2</t>",(_x select 0), (_x select 1)];
	_controlStartID = _controlStartID + 2;

}forEach _vehicleStats;

ctrlShow [2803,true];
ctrlShow [2830,true];
/*
(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
    (localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>$%1</t><br/>
    " +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>$%2</t><br/>
    " +(localize "STR_Shop_Veh_UI_Color")+ " %8<br/>
    " +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>
    " +(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>
    " +(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>
    " +(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>
    " +(localize "STR_Shop_Veh_UI_Fuel")+ " %7
    ",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
(_vehicleInfo select 8),
(_vehicleInfo select 11),
(_vehicleInfo select 10),
if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
(_vehicleInfo select 12),
_vehicleColor
];
*/
