#include "..\..\macros.hpp"
/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
private["_nearVehicles","_control","_chopMultiplier","_nearUnits","_price","_chopable"];
if !(playerSide isEqualTo civilian) exitWith {hint "Du bist kein Zivilist."};
if(DWEV_action_inUse) exitWith {hint "Einen moment bitte, es wird schon etwas gemacht..."};
disableSerialization;

_chopable = DWEV_SETTINGS(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),_chopable,25];
_nearUnits = (nearestObjects[player,["Man"],7]) arrayIntersect playableUnits;
if (count _nearUnits > 1) exitWith {hint "Du kannst kein Fahrzeug beim Fahrzeugschieber verkaufen, während ein Spieler in der Nähe ist!"};

DWEV_chopShop = (_this select 0);

//Error check
if(count _nearVehicles == 0) exitWith {titleText["Es gibt kein Fahrzeug zum verkauf in der nähe.","PLAIN"];};
if(!(createDialog "Chop_Shop")) exitWith {hint "Es gab ein problem mit dem Schwarzmarkt."};


_control = ((findDisplay 39400) displayCtrl 39402);
{
	if(alive _x) then 
	{
		_className = typeOf _x;
		_classNameLife = _className; //
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		
		if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
            _classNameLife = "Default"; //Use Default class if it doesn't exist
            diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
        };
		
		_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
        _chopMultiplier = DWEV_SETTINGS(getNumber,"vehicle_chopShop_multiplier");

        _price = _price * _chopMultiplier;
		
		if (!isNil "_price" && count crew _x isEqualTo 0) then 
		{
			if ((((_price) > 200000) && (_x getVariable["side","unknown"] != "med")) || (_x getVariable["side","unknown"] == "cop")) then
			{
				_price = (_price - ((damage _x) * _price));
				_control lbAdd _displayName;
				_control lbSetData [(lbSize _control)-1,str(_x)]; // Unsichtbarer text
				_control lbSetPicture [(lbSize _control)-1,_picture];
				_control lbSetValue [(lbSize _control)-1,_price];
			};
		};
	};
} foreach _nearVehicles;