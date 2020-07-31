/*
Created by: TheRick
fn_actAirSiren.sqf
*/
_allpoles = nearestObjects[(getMarkerPos ["medair_alarm1","medair_alarm2"]),["Land_Loudspeakers_F"],500];
{	
	if(isNil {_x getVariable "medairAlarm"}) then {_x setVariable ["medairAlarm",false,true];};
	if((_x getVariable "medairAlarm")) exitWith {};
	_x setVariable ["medairAlarm",true,true];
	[[_x],"life_fnc_medairSiren",nil,true] call life_fnc_MP;
} forEach _allpoles;