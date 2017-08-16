#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
if(!allowedToChop) exitWith {hint "Du kannst ein Fahrzeug nur alle 60 Sekunden verkaufen";};
if(allowedToChop) then {
	allowedToChop = false;
	[] spawn {
		sleep 60;
		allowedToChop = true;
	};
};
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = SEL(_nearVehicles,_vehicle);
if(isNull _vehicle) exitWith {};
if(playerSide != civilian) exitWith {hint localize "STR_Garage_Wrong_Side"};

_owners = _vehicle getVariable "vehicle_info_owners";
if(isNil {_owners}) exitWith {hint format ["Du kannst dieses Fahrzeug nicht verkaufen. Ein Administrator wurde informiert. Es besteht akuter Verdacht des Dupings."]; deleteVehicle _vehicle;};
life_action_inUse = true;
_price2 = CASH + _price;
if (life_HC_isActive) then {
	[player,_vehicle,_price,_price2] remoteExecCall ["HC_fnc_chopShopSell",HC_Life];
} else {
	[player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
};
[50] call life_fnc_updateEXP;
life_action_inUse = false;
closeDialog 0;