#include <macro.h>
/*
	File: fn_fuelStationSliderChange.sqf
	Author: MarioF
	Modified by: Altis Life Germany
	
	Description:
	Changes the FuelFit
*/

private["_display","_newFit"];
disableSerialization;

_display = findDisplay 29000;

_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_sliFit = _display displayCtrl 29012;

if(isNull life_fuelstation_fueltruck) then {
	_maxFit = ( floor (CASH / life_fuelstation_price)) min life_fuelstation_fitamount;
	_sliNew = sliderPosition _sliFit;
	if(_sliNew > _maxFit) then {
		_sliFit sliderSetPosition _maxFit;
	};
	life_fuelstation_amount = sliderPosition _sliFit;
	
	_txtCash ctrlSetText format["%1€", round (life_fuelstation_price * life_fuelstation_amount)];
};

life_fuelstation_amount = floor(sliderPosition _sliFit);
_newFit = life_fuelstation_amount;

_txtFit ctrlSetText format["%1 / %2 Liter", life_fuelstation_amount, life_fuelstation_fitamount];