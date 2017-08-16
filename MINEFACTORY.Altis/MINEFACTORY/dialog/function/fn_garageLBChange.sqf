#include "..\..\..\script_macros.hpp"
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_classNameLife","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_assurPrice","_assur"];
_control = SEL(_this,0);
_index = SEL(_this,1);

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format["%1",_dataArr];
_className = SEL(_dataArr,0);
_classNameLife = _className;
_assur = SEL(_dataArr,2);

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleColor = SEL(SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"textures"),SEL(_dataArr,1)),0);
if(isNil "_vehicleColor") then {_vehicleColor = "Default";};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_retrievePrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"storageFee"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"storageFee"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"storageFee"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"storageFee"),3)};
};

_sellPrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"garageSell"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"garageSell"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"garageSell"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"garageSell"),3)};
};

_assurPrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"assurPrice"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"assurPrice"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"assurPrice"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"assurPrice"),3)};
};

if(!(EQUAL(typeName _sellPrice,typeName 0)) OR _sellPrice < 1) then {_sellPrice = 1000};
if(!(EQUAL(typeName _retrievePrice,typeName 0)) OR _retrievePrice < 1) then {_retrievePrice = 1000};
if(!(EQUAL(typeName _assurPrice,typeName 0)) OR _assurPrice < 1) then {_assurPrice = 10000};

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
	( "Einstellpreis:")+ " <t color='#8cff9b'>$%1</t><br/>
	" +( "Verkaufspreis:")+ " <t color='#8cff9b'>$%2</t><br/>
	Versicherungs Preis: <t color='#8cff9b'>$%9</t><br/>
	Status Versicherung: %10<br/>
	" +( "Farbe:")+ " <t color='#8cff9b'>%8</t><br/>
	" +( "Max. Geschwindigkeit:")+ " <t color='#8cff9b'>%3 km/h</t><br/>
	" +( "Pferdestärken:")+ " <t color='#8cff9b'>%4</t><br/>
	" +( "Passagierplätze:")+ " <t color='#8cff9b'>%5</t><br/>
	" +( "Kofferraumgröße:")+ " <t color='#8cff9b'>%6</t><br/>
	" +( "Tankgröße:")+ " <t color='#8cff9b'>%7</t>
	",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
SEL(_vehicleInfo,8),
SEL(_vehicleInfo,11),
SEL(_vehicleInfo,10),
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
SEL(_vehicleInfo,12),
_vehicleColor,
[_assurPrice] call life_fnc_numberText,
if(_assur == 1) then {"<t color='#8cff9b'>Versichert</t>"} else {"<t color='#FF0000'>Keine Versicherung</t>"},
SEL(_vehicleInfo,9)
];

if(_assur == 1) then {
ctrlShow [97480,False];
}else{
ctrlShow [97480,True];
};

ctrlShow [2803,true];
ctrlShow [2830,true];