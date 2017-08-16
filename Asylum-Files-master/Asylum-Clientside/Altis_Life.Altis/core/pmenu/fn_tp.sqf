/*
	File: fn_visible.sqf
	Author: Alan
	
	Description:
	To teleport an admin to a location.
*/
_toMe = param[0];
if(_toMe) exitWith {
	_toThem = param[1,false];
	_unit = lbData[2902,lbCurSel (2902)];
	_unit = call compile format["%1", _unit];
	if(_unit == player) exitWith {};
	if(isNil "_unit") exitWith {};
	if(isNull _unit) exitWith {};
	if(_toThem) exitWith {player setPosATL getPosATL vehicle _unit};
	vehicle _unit setPosATL getPosATL player;
};
[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.05;
  };
};
titleText ["Click on the map to teleport.","plain", 0.4];
openMap true;
onMapSingleClick "(vehicle player) setPos _pos; openMap false; onMapSingleClick """";";
