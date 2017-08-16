/*
	File: fn_joinEvent.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player joins into an event as a participant
*/

if (count life_active_event == 0) exitWith {};

_event = life_active_event select 0;
_start = life_active_event select 1;
_pending = life_active_event select 2;

if (!_pending) exitWith { hint "Sorry, but the event has already begun!" };

life_event_startpos = getPos player;
hint "You've joined the event successfully. Stay nearby and the event will begin anytime within the next few minutes.";
[[player,true],"ASY_fnc_addToEvent",false,false] spawn life_fnc_MP;

_end = _start + 300;

while {true} do
{
	if ((_end - time) < 1) exitWith {};
	hintSilent parseText format["Event ESTIMATED to begin in<br/><br/>%1 second(s)", floor (_end - time)];
	sleep 1;
	_exit = false;
	if (count life_active_event > 0) then
	{
		if (!(life_active_event select 2)) then { _exit = true; hintSilent ""; cutText["Do NOT DRIVE until the countdown completes.","BLACK FADED"]; 0 cutFadeOut 9999999; sleep 2; 0 cutFadeOut 1; };
		if (player distance life_event_startpos > 30 && (_end - time) > 10) then { _exit = true; hint "You've gone too far from the event entry location and have been removed from the event."; [[player,false],"ASY_fnc_addToEvent",false,false] spawn life_fnc_MP; };
	};
	if (_exit) exitWith {};
};