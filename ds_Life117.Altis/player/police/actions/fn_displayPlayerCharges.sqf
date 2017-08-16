/*
	File: fn_displayPlayerCharges.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays a players charges to the officers screen
*/
private["_display","_text","_units","_charge","_chargeStr","_list","_list2","_bounty","_locations","_minutes","_time"];

_text = _this select 0;
_locations = _this select 1;
disableSerialization;
_display = findDisplay 606606;
_list = _display displayCtrl 1666;
_list2 = _display displayCtrl 1667;
//if(isNil "_test")exitwith{hint "No information to display"};
_bounty = _text select 0;
_time = serverTime;

lbClear _list;
lbClear _list2;

{
	if(_forEachIndex > 0)then
		{
		_list lbAdd format["%1 count(s) of %2",(_x select 1),(_x select 0)];
		};
}forEach _text;


_list2 lbAdd "Persons Total Bounty";
_list2 lbAdd format["$ %1",[_bounty] call DS_fnc_numberText];
_list2 lbAdd "";
_list2 lbAdd "Players Records";

{
	_minutes = (_x select 1);
	_minutes = _time - _minutes;
	_minutes = (round(_minutes/60));
	_list2 lbAdd format["%1 - %2 Mins ago",(_x select 0),_minutes];
	
}forEach _locations;

