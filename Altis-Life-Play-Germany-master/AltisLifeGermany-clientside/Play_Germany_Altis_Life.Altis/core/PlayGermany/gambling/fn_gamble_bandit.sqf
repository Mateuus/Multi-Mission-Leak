#include <macro.h>
/*
	File:
	Author: Wolfgang Bahmüller

	Description:
	Casino slotmachine

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/

disableSerialization;

private["_return","_image1","_image2","_image3","_idx1","_idx2","_idx3","_gamble_val","_gamble_win_factor","_jackpot_won","_reroll"];

_jackpot_won = 0;

if(king_gamble_player_is_blocked == 1) exitWith
{
    //['einarmiger Bandit'] call king_fnc_gambling;
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

_icons = ["cat_001.paa","cat_002.paa","cat_003.paa","cat_004.paa","cat_005.paa","cat_006.paa","cat_007.paa","cat_008.paa","cat_009.paa","cat_010.paa","cat_011.paa","cat_012.paa"];
//images von https://www.iconfinder.com/search/?q=iconset%3Acat-force
//License: Free for commercial use

while {king_gamble_roll_time_to_wait > 0} do
{
    _display = findDisplay 5000;

    _image1 = _display displayCtrl 5201;
    _image2 = _display displayCtrl 5202;
    _image3 = _display displayCtrl 5203;

    _idx1 = floor(random count _icons);
    _idx2 = floor(random count _icons);
    _idx3 = floor(random count _icons);

    //lower the win chance...
    if( (_idx1 == _idx2) || (_idx2 == _idx3) || (_idx1 == _idx3) ) then
    {
        _reroll = random 10;
        if(_reroll < king_gamble_reroll_if_won_factor_bandit) then
        {
            _idx1 = floor(random count _icons);
            _idx2 = floor(random count _icons);
            _idx3 = floor(random count _icons);
        };
    };

    _image1 ctrlSetStructuredText parseText format["<img size='2.5' image='icons\gambling\%1'/>", _icons select _idx1 ];
    _image2 ctrlSetStructuredText parseText format["<img size='2.5' image='icons\gambling\%1'/>", _icons select _idx2 ];
    _image3 ctrlSetStructuredText parseText format["<img size='2.5' image='icons\gambling\%1'/>", _icons select _idx3 ];

    sleep 0.05;
};


if( (_idx1 == _idx2) || (_idx2 == _idx3) || (_idx1 == _idx3) ) then
{
    //won
    _gamble_win_factor = king_gamble_bandit_win_factor_two_of_a_kind select king_gamble_casino_idx;
    if( (_idx1 == _idx2) && (_idx2 == _idx3) && (_idx1 == _idx3) ) then
    {
        _gamble_win_factor = king_gamble_bandit_win_factor_three_of_a_kind select king_gamble_casino_idx;
    };
    if( (_idx1 == 0) && (_idx2 == 0) && (_idx3 == 0) ) then
    {
        //JACKPOT!!!
        _jackpot_won = 1;
    };
    _return = 1;
}
else
{
    //lost
    _gamble_win_factor = 1;
    _return = 0;
};

['einarmiger Bandit', _return, _gamble_val, _gamble_win_factor, _jackpot_won] call king_fnc_gamble;
