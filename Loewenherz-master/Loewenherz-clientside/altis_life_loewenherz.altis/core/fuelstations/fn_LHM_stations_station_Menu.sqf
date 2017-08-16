/*
	File: fn_station_capture.sqf
	Author: Barney

	Description:



	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/



//"Land_fs_feed_F"
//"Land_fs_feed_F"
disableSerialization;
closeDialog 0;
createDialog "LHM_fuelstations";

waitUntil {!isnull(findDisplay 8955)};


_display = findDisplay 8955;
_listbox = _display displayCtrl 1500;
_structured_text = _display displayCtrl 1100;
_BTN_setPrice = _display displayCtrl 2400;
_BTN_sell = _display displayCtrl 2401;
_slider = _display displayCtrl 1900;


{
	_listbox lbadd format["Tankstelle: %1",(_foreachindex + 1)];
	_listbox lbSetValue[_foreachindex,_foreachindex];


} foreach LHM_gastations_owned;

_slider sliderSetRange[4,30];



















