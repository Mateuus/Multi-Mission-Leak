/*
	fn_updateUI.sqf
	Pennyworth
*/

private ["_strDisplay", "_value", "_control"];

_strDisplay = str ((_this select 0) select 0);
_value = (_this select 0) select 1;
_mode = param [1, false];

if(_strDisplay find "17501" != -1) then {
	call compile format ["ctrlSetText [17521, ""%1%2""]", floor(_value*10),"%"];
};
if(_strDisplay find "17502" != -1) then {
	call compile format ["ctrlSetText [17522, ""%1%2""]", floor(_value*10),"%"];
};
if(_strDisplay find "17503" != -1) then {
	call compile format ["ctrlSetText [17523, ""%1%2""]", floor(_value*10),"%"];
};

_control = (findDisplay 17500) displayCtrl 17504;

_control ctrlSetBackgroundColor [(sliderPosition 17501)/10, (sliderPosition 17502)/10, (sliderPosition 17503)/10, 1];

if(_mode) then {
	life_lastShownVehicleColors = [(sliderPosition 17501)/10,(sliderPosition 17502)/10,(sliderPosition 17503)/10];
};