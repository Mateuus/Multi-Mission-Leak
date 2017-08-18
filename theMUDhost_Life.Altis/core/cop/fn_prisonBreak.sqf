/*
	File: fn_prisonBreak.sqf
	Author: Michael Francis (Amras86)
	
	Description: Allows cops to activate an alarm in the prison with an audible alarm,
	also sends a message to cops when its been activated and de-activated.
*/

_msg = "!!!ALERT!!! A prison break alarm has been activated by this officer. Please send back up immediately.";
_msg2 = "Prison break alarm has been deactivated by this officer. All is clear.";

if((palarm getVariable["alarm_playing",false])) exitWith
{
	hint "You have turned off the prison alarm.";
	[2,-1,_msg2] call life_fnc_newMsg;
	hint "";
	palarm setVariable["alarm_playing",false,true];
	deleteMarker "MarkerPrison";
};

palarm setVariable["alarm_playing",true,true];
[2,-1,_msg] call life_fnc_newMsg;

//Create a marker
_Pos = position palarm;
_marker = createMarker ["MarkerPrison", _Pos];
"MarkerPrison" setMarkerColor "ColorRed";
"MarkerPrison" setMarkerText "!!! PRISON BREAK !!!";
"MarkerPrison" setMarkerType "mil_warning";

while {(palarm getVariable["alarm_playing",false])} do
{
	[[palarm, "prison_alarm",250],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	sleep 21;
};