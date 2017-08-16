/*
	File: fn_fuelStationSliderChange.sqf
	Author: MarioF
	
	Description:
	Changes the FuelFit
*/

private["_display","_newFit"];
disableSerialization;

_display = findDisplay 29000;

_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_sliFit = _display displayCtrl 29012;

if(isNull lhm_fuelstation_fueltruck) then {
	_maxFit = ( floor (lhm_atmcash / lhm_fuelstation_price)) min lhm_fuelstation_fitamount;
	_sliNew = sliderPosition _sliFit;
	if(_sliNew > _maxFit) then {
		_sliFit sliderSetPosition _maxFit;
	};
	lhm_fuelstation_amount = sliderPosition _sliFit;
	
	_txtCash ctrlSetText format["$%1", round (lhm_fuelstation_price * lhm_fuelstation_amount)];
};

lhm_fuelstation_amount = floor(sliderPosition _sliFit);
_newFit = lhm_fuelstation_amount;

_txtFit ctrlSetText format["%1 / %2 Liter", lhm_fuelstation_amount, lhm_fuelstation_fitamount];