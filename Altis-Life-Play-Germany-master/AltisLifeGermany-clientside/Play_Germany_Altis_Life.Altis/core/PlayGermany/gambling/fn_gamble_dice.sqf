#include <macro.h>
/*
	File:
	Author: Wolfgang Bahmüller

	Description:
	Casino roll the dice

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/

disableSerialization;

private["_return","_image1","_image2","_idx1","_idx2","_gamble_val","_gamble_win_factor","_dice_value","_jackpot_won"];

_jackpot_won = 0;

if(king_gamble_player_is_blocked == 1) exitWith
{
    //['Dice'] call king_fnc_gambling;
};

if(king_gamble_roll_time_to_wait > 0) exitWith
{
    //hint format["You have gambled too fast! Please wait"];
};

//check if Display is still open
_display = findDisplay 5000;
if(isNull _display) exitWith {hint "Display is gone...";};

//parse input values
_gamble_val = parseNumber(ctrlText 5002);

//value check
if(_gamble_val > king_gamble_max_bet) exitWith {hint format["%1 %2€", king_gamble_you_cant_gamble_more_then, [king_gamble_max_bet] call life_fnc_numberText];};
if(_gamble_val <= 0) exitwith {hint format["%1", king_gamble_please_enter_a_value_above_zero];};
if(!([str(_gamble_val)] call TON_fnc_isnumber)) exitWith {hint format["%1", king_gamble_this_isnt_an_actual_number_format];};
if(_gamble_val > CASH) exitWith {hint format["%1", king_gamble_not_that_much_money];};
if(king_gamble_npc_name distance player > 5) exitWith {hint format["%1", king_gamble_too_far_away_from_npc];};

//start the gamble roll timer
king_gamble_roll_time_to_wait = king_gamble_roll_time;
[] spawn king_fnc_gamble_timer;

_icons = ["dice_1.paa", "dice_2.paa", "dice_3.paa", "dice_4.paa", "dice_5.paa", "dice_6.paa"];

while {king_gamble_roll_time_to_wait > 0} do
{
    _display = findDisplay 5000;

    _image1 = _display displayCtrl 5101;
    _image2 = _display displayCtrl 5102;

    _idx1 = floor(random count _icons);
    _idx2 = floor(random count _icons);

    //lower the win chance...
    _dice_value = _idx1 + 1 + _idx2 + 1;
    if( (((_idx1 + 1) == 6) && ((_idx2 + 1) == 6)) || _dice_value == 7) then
    {
        _reroll = random 10;
        if(_reroll < king_gamble_reroll_if_won_factor_dice) then
        {
            _idx1 = floor(random count _icons);
            _idx2 = floor(random count _icons);
        };
    };

    _image1 ctrlSetStructuredText parseText format["<img size='2.5' image='icons\gambling\%1'/>", _icons select _idx1 ];
    _image2 ctrlSetStructuredText parseText format["<img size='2.5' image='icons\gambling\%1'/>", _icons select _idx2 ];

    sleep 0.05;
};

_dice_value = _idx1 + 1 + _idx2 + 1;

if( (((_idx1 + 1) == 6) && ((_idx2 + 1) == 6)) || _dice_value == 7) then
{
    //won
    _gamble_win_factor = king_gamble_dice_win_factor_two_of_a_kind select king_gamble_casino_idx;
    if( _dice_value == 7 ) then
    {
        _gamble_win_factor = king_gamble_dice_win_factor_sum_seven select king_gamble_casino_idx;
    };
    _return = 1;
}
else
{
    //lost
    _gamble_win_factor = 1;
    _return = 0;
};


['Dice', _return, _gamble_val, _gamble_win_factor, _jackpot_won] call king_fnc_gamble;
