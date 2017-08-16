#include <macro.h>
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

_vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);
_basePrice = _basePrice * PG_donGoalMulti;

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

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
[_basePrice] call life_fnc_numberText,
[round(_basePrice * 1.5)] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9
];

_ctrl = CONTROL(2300,2304);
lbClear _ctrl;
_colorArray = M_CONFIG(getArray,CONFIG_VEHICLES,_className,"textures");

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	_add = false;
	if((_textureName == "Taxi") && {!license_civ_taxi}) then {_flag = "nope"};
	if((_textureName == "Twitch") && {!license_civ_twitch}) then {_flag = "nope"};
	if((_textureName == "Twitch") && {_forEachIndex == 19} && {getPlayerUID player != "76561197965481006"}) then {_flag = "nope"};
	//if((count _x >= 4) && {(_x select 3) == 1} && {FETCH_CONST(life_donatorlevel) < 1}) then {_flag = "nope"};
	if((_className in (LIFE_SETTINGS(getArray,"vehicleShop_donColorOnly"))) && {FETCH_CONST(life_donatorlevel) < 1}) then {_flag = "nope"};
	if(EQUAL(SEL(life_veh_shop,2),_flag)) then {
		_add = true;
	} else {
		if((SEL(life_veh_shop,2) in ["cop","event"]) && {_flag in ["civ","reb"]} && {license_cop_kripo || (FETCH_CONST(life_coplevel) > 5) || (FETCH_CONST(life_eventlevel) > 0)}) then {
			_add = true;
		} else {
			if(EQUAL(_flag,"sek") && license_cop_sek) then {
				_add = true;
			} else {
				if((EQUAL(SEL(life_veh_shop,2),"don")) && {_flag in ["civ","reb"]} && {license_civ_donator}) then {
					_add = true;
				};
			};
		};
	};
	if(_add) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
		if((count _x >= 4) && {(_x select 3) == 1}) then {
			_ctrl lbSetData [(lbSize _ctrl)-1,"don"];
		};
	};
} foreach _colorArray;

[0] spawn PG_fnc_changeCar;

if(((_className in (LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly"))) || ((_className in (LIFE_SETTINGS(getArray,"vehicleShop_goalRentalOnly"))) && !PG_donGoalReached)) && (playerSide == civilian)) then {
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