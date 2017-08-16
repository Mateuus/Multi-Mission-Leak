#include "..\..\script_macros.hpp"

disableSerialization;
private["_control","_index","_className","_classNameLife","_basePrice","_vehicleConfig","_vehicleStats","_colorArray","_ctrl","_maxSpeed","_fuelCapacity","_trunkCapacity","_armorRating","_controlStartID"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_classNameLife = _className;
_vIndex = _control lbValue _index;

_vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);

// -- Grab info for bars
/*_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_maxSpeed = _vehicleInfo select 8;
_fuelCapacity = _vehicleInfo select 12;
_armorRating = _vehicleInfo select 12;*/

//Should be slightly faster
_vehicleConfig = configFile >> "CfgVehicles" >> _className;
_maxSpeed = getNumber (_vehicleConfig >> "maxSpeed");
_fuelCapacity = getNumber (_vehicleConfig >> "maxSpeed");
_armorRating = getNumber(_vehicleConfig >> "armor");
_trunkCapacity = [_className] call life_fnc_vehicleWeightCfg;


ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%1</t><br/>"+
(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%2</t><br/>",
[_basePrice] call life_fnc_numberText,
[round(_basePrice * 0.5)] call life_fnc_numberText
];

_vehicleStats = [];
_vehicleStats pushBack ["Max Speed", format["%1km/h", _maxSpeed], _maxSpeed/1059];
_vehicleStats pushBack ["Trunk Capacity", format["%1", _trunkCapacity], _trunkCapacity/600];
_vehicleStats pushBack ["Armor",format["%1", _armorRating], _armorRating/5000];
_vehicleStats pushBack ["Fuel Tank", format["%1l", _fuelCapacity], _fuelCapacity/4500];
	
_controlStartID = 2310;
{

	CONTROL(2300,_controlStartID) progressSetPosition (_x select 2);
	CONTROL(2300,_controlStartID + 1) ctrlSetStructuredText parseText format ["<t align = 'left'>%1</t><t align = 'right'>%2</t>",(_x select 0), (_x select 1)];
	_controlStartID = _controlStartID + 2;

}forEach _vehicleStats;

// Textures list
_ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};

_colorArray = M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"textures");

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);

	if(EQUAL(SEL(life_veh_shop,2),_flag)) then {

			_ctrl lbAdd _textureName;
			_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} foreach _colorArray;

if(_className in (LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
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