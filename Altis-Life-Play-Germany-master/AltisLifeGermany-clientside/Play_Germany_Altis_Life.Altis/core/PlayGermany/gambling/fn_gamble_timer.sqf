#include <macro.h>
/*
	File:
	Author: Wolfgang Bahmüller
	
	Description:
	Gambling Gambling Gambling!!!
*/

//prevent multiple processing
if(king_gamble_roll_timer_is_running == 1) exitWith {};
king_gamble_roll_timer_is_running = 1;

disableSerialization;

//show the bar and timer
ctrlShow [5003, true];
ctrlShow [5005, true];

while {king_gamble_roll_time_to_wait > 0} do
{ 
    _display = findDisplay 5000;
    king_gamble_roll_time_to_wait = king_gamble_roll_time_to_wait - 0.1;
    sleep 0.1;
    if(king_gamble_roll_time_to_wait < 0) then
    {
        king_gamble_roll_time_to_wait = 0;
    };
    //_text_timer = _display displayCtrl 5003;
    //_text_timer ctrlSetStructuredText parseText format["%1sec",[king_gamble_roll_time_to_wait] call life_fnc_numberText];

    _bar2 = _display displayCtrl 5005;
    _bar2 progressSetPosition king_gamble_roll_time_to_wait / king_gamble_roll_time;
};

//hide the bar and timer
ctrlShow [5003, false];
ctrlShow [5005, false];

king_gamble_roll_timer_is_running = 0;
