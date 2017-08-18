/*
	File: fn_reportStolen.sqf
	Author: Kevin Webb
	
	Description:
	OH NOES I DIDN'T TAKE GOOD CARE OF MY VEHICLE, HEEEELLLLLPPPP
	
	Modified to send police message.
*/
private["_dialog","_list","_sel","_vehicle","_index","_msg","_msg2"];
disableSerialization;

_msg = format["This person has just reported their vehicle stolen! GPS Tracking device actived on stolen vehicle. Be on the look out!"];
_msg2 = format["This person is no longer claiming their vehicle stolen."];

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "You didn't select a vehicle";};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {hint "You can't report your house stolen!"};
if(!(_vehicle getVariable["tracking",false])) exitWith { hint "If you would have invested in a GPS Tracker for your vehicle, maybe the police could have helped you in your time of need..."; };

if(_vehicle getVariable["stolen",false]) then
{
	[2,-1,_msg2] call life_fnc_newMsg;
	_vehicle setVariable["stolen",false,true]; hint "You have removed your vehicle from the stolen vehicles list"; //nah it isn't stolen
}
else
{
	[2,-1,_msg] call life_fnc_newMsg;
	_vehicle setVariable["stolen",true,true]; hint "You have reported your vehicle stolen - this puts it on the map for the police.";
}; //or is it?