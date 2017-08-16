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




private ["_tankstellen_Marker","_fail","_display","_listbox","_structured_text","_BTN_setPrice","_BTN_sell","_slider","_selected","_tanke","_netid","_distanceChosen","_distance","_npc","_marker","_foreachindex"];
if(isnull(findDisplay 8955)) exitWith {diag_log "Falsches Display!";};
_tankstellen_Marker = [];
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

_tanke setVariable["gekauft",nil,true];
_tanke setVariable["kaeufer",nil,true];

_tanke;
LHM_gastations_owned = LHM_gastations_owned - [_tanke];
profileNamespace setVariable["LHM_gastations_owned",LHM_gastations_owned];


{
	_tankstellen_Marker pushBack format["GasMarker_%1",_x];

} foreach [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

_distanceChosen = 5000;
{
	_distance = _npc distance (getmarkerpos(_x));
	if(_distance < _distanceChosen) then {
		_distanceChosen = _distance;
		_marker = _x;
	};

} foreach _tankstellen_Marker;

_marker setMarkerText format["Gas Station"];

lbClear _listbox;

{
	_listbox lbadd format["Tankstelle: %1",_foreachindex + 1];
	_listbox lbSetValue[_foreachindex,_foreachindex];


} foreach LHM_gastations_owned;

_structured_text ctrlSetStructuredText parseText "";













