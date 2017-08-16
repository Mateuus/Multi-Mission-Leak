#include <macro.h>
/*
	File:
	Author: Wolfgang Bahmüller
	
	Description:
	Casino gamble result processing script

*/

private["_display","_gambling_result","_won","_gamble_val","_gamble_type","_gamble_return","_gamble_win_factor","_watched_gambling","_jackpot_won","_gamble_val_to_jackpot","_jackpot","_casino_is_illegal"];

_display = findDisplay 5000;
_gambling_result = _display displayCtrl 5007;

//check if Display is still open
if(isNull _display) exitWith {};

if(king_gamble_player_is_blocked == 1) exitWith{};

if(king_gamble_roll_time_to_wait > 0) exitWith{};

//parse input values
_gamble_type        = param [0,"",[""]];
_gamble_return      = param [1,0,[0]];
_gamble_val         = param [2,0,[0]];
_gamble_win_factor  = param [3,0,[0]];
_jackpot_won        = param [4,0,[0]];

//value check
if(_gamble_val > king_gamble_max_bet) exitWith {hint format["%1 $%2", king_gamble_you_cant_gamble_more_then, [king_gamble_max_bet] call lhm_fnc_numberText];};
if(_gamble_val <= 0) exitwith {hint format["%1", king_gamble_please_enter_a_value_above_zero];};
if(!([str(_gamble_val)] call TON_fnc_isnumber)) exitWith {hint format["%1", king_gamble_this_isnt_an_actual_number_format];};
if(_gamble_val > lhm_cash) exitWith {hint format["%1", king_gamble_not_that_much_money];};
if(king_gamble_npc_name distance player > 5) exitWith {hint format["%1", king_gamble_too_far_away_from_npc];};



_won = 0;


if(_gamble_return == 1) then
{
    _won = 1;
    _gamble_val = _gamble_val * _gamble_win_factor;
}
else
{
    _won = 0;
};

//block the player for gambling and set the time for the next try
king_gamble_player_is_blocked = 1;
king_gamble_unblock_time = time + king_gamble_player_is_blocked_after_gambling;

if(_won == 1) then
{
    lhm_cash = lhm_cash + _gamble_val;
    if(_jackpot_won == 1) then
    {
        _casino_is_illegal = king_gamble_casino_is_illegal select king_gamble_casino_idx;
        _jackpot = king_gamble_jackpot select _casino_is_illegal;

        //The Player gets the Pot!!!
        [[player, king_gamble_casino_is_illegal select king_gamble_casino_idx],"lhm_fnc_gambleJackpotWon",false,false] call lhm_fnc_mp;
        if(king_gamble_send_jackpot_win_to_chat == 1) then
        {
            [[0,format["%1 %2",name player, king_gamble_send_jackpot_won_to_chat_message]],"lhm_fnc_broadcast",nil,false] call lhm_fnc_mp;
        };

        playSound "casinojackpot";
        hint format["%1 $%2", king_gamble_jackpot_won_text, [_jackpot] call lhm_fnc_numberText];
        _gambling_result ctrlSetStructuredText parseText format["%1 $%2", king_gamble_jackpot_won_text, [_jackpot] call lhm_fnc_numberText]; 
    }
    else
    {
        playSound "casinowin";
        hint format["%1 $%2", king_gamble_won_text, [_gamble_val] call lhm_fnc_numberText];
        _gambling_result ctrlSetStructuredText parseText format["%1 $%2", king_gamble_won_text, [_gamble_val] call lhm_fnc_numberText]; 
    };

}
else
{
    lhm_cash = lhm_cash - _gamble_val;
    //add the lost money to the jackpot
    _gamble_val_to_jackpot = ceil (_gamble_val * (king_gamble_add_lost_money_to_the_jackpot_percent / 100.0));
    if(_gamble_val_to_jackpot < 1) then
    {
        //in case of a low bid we add min. $1 to the jackpot
        _gamble_val_to_jackpot = 1;
    };
    [[player, _gamble_val_to_jackpot, king_gamble_casino_is_illegal select king_gamble_casino_idx],"lhm_fnc_gambleJackpotAdd",false,false] call lhm_fnc_mp;

    playSound "casinolost";
    hint format["%1 $%2", king_gamble_lost_text, [_gamble_val] call lhm_fnc_numberText];
    _gambling_result ctrlSetStructuredText parseText format["%1 $%2", king_gamble_lost_text, [_gamble_val] call lhm_fnc_numberText]; 
};


//illegal gambling
if(king_gamble_casino_is_illegal select king_gamble_casino_idx == 1) then
{
    _watched_gambling = random 100;
    if(_watched_gambling < king_gamble_watched_illegal_gambling_percent) then
    {
		[[player,"Alarm_Blufor"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
        [[getPlayerUID player,name player,"42"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
        _gambling_result ctrlSetStructuredText parseText format["%1", king_gamble_you_have_been_watched_gambling_illegal];
        if(king_gamble_send_watched_illegal_gambling_to_chat == 1) then
        {
            [[0,format["%1 %2",name player, king_gamble_send_watched_illegal_gambling_to_chat_message]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
        };
    };
};

//hint format["Param |%1|, |%2|, |%3|, |%4|, |%5|", _gamble_type, _gamble_return, _gamble_val, _lhm_cash_OLD, lhm_cash];

//save data to db
[1] call SOCK_fnc_updatePartial;

//call the base function again to refresh the ui
[_gamble_type] call lhm_fnc_gambling;
