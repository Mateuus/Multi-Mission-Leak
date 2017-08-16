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

private ["_fail","_display","_listbox","_structured_text","_BTN_setPrice","_BTN_sell","_slider","_diplay","_selected","_tanke","_preis"];

if(isnull(findDisplay 8955)) exitWith {diag_log "Falsches Display!";};

_fail = false;
_display = findDisplay 8955;
_listbox = _display displayCtrl 1500;
_structured_text = _display displayCtrl 1100;
_BTN_setPrice = _display displayCtrl 2400;
_BTN_sell = _display displayCtrl 2401;
_slider = _display displayCtrl 1900;

_selected = lbCurSel _listbox;
if(_selected == -1) exitWith {};

_tanke = LHM_gastations_owned select _selected;

_preis = _tanke getvariable["Price",8];

_slider sliderSetPosition _preis;


if(round(_preis) == 8) then {
	_structured_text ctrlSetStructuredText parseText format["<t align='center'>Preis pro Liter: <br/> %1$ (normal)</t>",round(_preis)];
} else {
	_structured_text ctrlSetStructuredText parseText format["<t align='center'>Preis pro Liter: <br/> %1$</t>",round(_preis)];
};




if(_fail) exitWith {diag_log "Something went wrong";};















