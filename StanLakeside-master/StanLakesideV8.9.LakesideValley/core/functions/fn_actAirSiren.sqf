/*
Created by: TheRick
fn_actAirSiren.sqf
*/
_allpoles = nearestObjects[(getMarkerPos ["air_alarm1","air_alarm2","air_alarm3","air_alarm4","air_alarm5","air_alarm6"]),["Land_Loudspeakers_F"],500];
{	
	if(isNil {_x getVariable "airAlarm"}) then {_x setVariable ["airAlarm",false,true];};
	if((_x getVariable "airAlarm")) exitWith {};
	_x setVariable ["airAlarm",true,true];
	[[_x],"life_fnc_airSiren",nil,true] call life_fnc_MP;
} forEach _allpoles;