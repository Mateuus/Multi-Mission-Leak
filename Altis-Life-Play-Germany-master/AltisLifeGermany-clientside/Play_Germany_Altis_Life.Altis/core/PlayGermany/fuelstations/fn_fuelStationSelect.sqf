#include <macro.h>
/*
	File: fn_fuelStationSelect.sqf
	Author: MarioF
	Modified by: Altis Life Germany

	Description:
	Prepares the FuelstationMenu for the Selection
*/

private["_display","_selIndex","_fitFuel","_perLitre","_cashFit","_veh"];
disableSerialization;

_listVeh = (_this select 0) select 0;
_selIndex = (_this select 0) select 1;

_display = findDisplay 29000;

_txtVeh = _display displayCtrl 29002;
_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_sliFit = _display displayCtrl 29012;
_btnRefill = _display displayCtrl 29021;
_txtCash ctrlShow false;

_nearVeh = nearestObjects[(getPos player),["Car","Air"],30];
{ if(str(_x) == (_listVeh lbData _selIndex)) exitWith { _veh = _x; }; } foreach _nearVeh;
_isTrailer = (_listVeh lbValue _selIndex);

if(isNil "_veh" || {isNull _veh}) exitWith { life_action_inUse = false; hint "Fahrzeug nicht mehr in der Nähe!"; };

life_fuelstation_lockVeh = [_veh,_isTrailer];

_txtVeh ctrlShow true;
if(!isNull life_fuelstation_fueltruck) then {
	_txtVeh ctrlSetText format["Tanklaster"];
} else {
	_txtVeh ctrlSetText format["Tankstelle (%1€ / l))", life_fuelstation_price];
};

if(_isTrailer == 1) then {
	_fitFuel = [(typeOf _veh) + "_TRAILER"] call PG_fnc_vehFuelCap;
	_fitFuel = floor (_fitFuel - (_veh GVAR["fueltruck_fuel",0]));
} else {
	_fitFuel = [typeOf _veh] call PG_fnc_vehFuelCap;
	_fitFuel = floor (_fitFuel - ((fuel _veh) * _fitFuel));
};
if(!isNull life_fuelstation_fueltruck) then { _fitFuel = (life_fuelstation_fueltruck GVAR["fueltruck_fuel",0]) min _fitFuel; };
life_fuelstation_fitamount = _fitFuel;

_sliFit ctrlShow true;
_sliFit sliderSetSpeed [1,1];
_sliFit sliderSetRange [0, _fitFuel];
if(isNull life_fuelstation_fueltruck) then {
	_cashFit = ( floor (CASH / life_fuelstation_price)) min _fitFuel;
	_sliFit sliderSetPosition _cashFit;
	_txtCash ctrlShow true;
	_txtCash ctrlSetText format["%1€", round (_cashFit * life_fuelstation_price)];
} else {
	_cashFit = floor _fitFuel;
};
_txtFit ctrlShow true;
_txtFit ctrlSetText format["%1 / %2 Liter", _cashFit, _fitFuel];
life_fuelstation_amount = _cashFit;

_btnRefill ctrlShow true;