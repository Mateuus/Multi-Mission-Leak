#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2","_chopable","_distance","_smoke","_str"];
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_classNameLife = _control lbData (lbCurSel _control);
_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"price");
_chopMultiplier = LIFE_SETTINGS(getNumber,"vehicle_chopShop_multiplier");
_price = _price * _chopMultiplier;
_chopable = LIFE_SETTINGS(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,_chopable,25];
_distance = 0;
{
    if(typeOf _x == _classNameLife) then
	{
		if((_distance == 0) or (getMarkerPos life_chopShop distance2D _x < _distance)) then
		{
			_distance = getMarkerPos life_chopShop distance2D _x;
			_vehicle = _x
		};
	};
} forEach _nearVehicles;
if(isNull _vehicle) exitWith {systemChat "Nie ma bugowania!!!";};
if(_distance == 0) exitWith {
	_smoke = "SmokeShellBlue" createVehicle (position player);
	_smoke attachto [player, [0,0,0]];
	_str = parseText "<t color='#FF69B4' size='3.5'>Powiem Mamie, BUGGERZE!!!</t>";
	hint _str; 
};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = CASH + _price;

if(life_HC_isActive) then {
	[player,_vehicle,_price,_price2] remoteExecCall ["HC_fnc_chopShopSell",HC_Life];
} else {
	[player,_vehicle,_price,_price2,_classNameLife] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
};

if(EQUAL(LIFE_SETTINGS(getNumber,"player_advancedLog"),1)) then {
	if(EQUAL(LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging"),1)) then {
		advanced_log = format ["chopped vehicle %1 for %2  On Hand Cash(pre-chop): %3",_vehicle,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText];
	} else {
		advanced_log = format ["%1 - %2 chopped vehicle %3 for %4  On Hand Cash(pre-chop): %5",profileName,(getPlayerUID player),_vehicle,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText];
	};
	publicVariableServer "advanced_log";
};

closeDialog 0;