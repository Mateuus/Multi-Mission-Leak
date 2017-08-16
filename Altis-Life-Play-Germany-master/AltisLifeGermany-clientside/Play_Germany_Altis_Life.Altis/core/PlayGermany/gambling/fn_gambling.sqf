#include <macro.h>
/*
	File: fn_gambling.sqf
	Author: Wolfgang Bahmüller

	Description:
	Casino main processing script

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/
private["_display","_gamble_type","_text_your_money","_gambling_blockerstatus","_dice_rules1","_dice_rules2","_bandit_rules1","_bandit_rules2","_jackpot_rules","_npc_paras","_legal_illegal_text","_casino_is_illegal"];
disableSerialization;

//spawn this thread only once (processing the blocker state and displays the countdown)
if(king_gamble_get_data_thread_is_running == 0) then
{
    king_gamble_get_data_thread_is_running = 1;

    [] spawn
    {
        disableSerialization;
        //diag_log format ["%1 ::King:: SPAWN LOOP NOW!!!!", time];
        private["_disp","_gambling_blockerstatus","_time_to_unblock","_minutes_to_unblock","_seconds_to_unblock","_minutes_to_unblock_string","_seconds_to_unblock_string","_gambling_jackpot_text","_jackpot"];
        _disp = findDisplay 5000;
        _time_to_unblock = 0;

        while {king_gamble_get_data_thread_is_running == 1} do
        {
            //hint format["king_gamble_unblock_time=%1 _time_to_unblock=%2 king_gamble_player_is_blocked=%3", king_gamble_unblock_time,_time_to_unblock,king_gamble_player_is_blocked];
            //diag_log format ["%1 ::King:: LOOP NOW!!!! [%2]", time, _disp];

            //wurde das Fenster geschlossen? OK checken ob ggf schon ein neues da ist...
            if(isNull _disp) then
            {
                _disp = findDisplay 5000;
            };

            //ist es nun wieder da?
            if(isNull _disp) exitWith
            {
                //the dialog is closed but we want to wait the rest of the block time.
                if(king_gamble_player_is_blocked == 0) then
                {
                    king_gamble_get_data_thread_is_running = 0;
                }
                //hint "Display is gone...";
            };

            if(king_gamble_player_is_blocked == 1) then
            {
                //calculate the seconds the player is blocked
                _time_to_unblock = king_gamble_unblock_time - time;
                _time_to_unblock = floor _time_to_unblock;
                if(_time_to_unblock < 0) then
                {
                    //blocktime is over so release the player
                    _time_to_unblock = 0;
                    king_gamble_unblock_time = 0;
                    king_gamble_player_is_blocked = 0;
                };
                _seconds_to_unblock = _time_to_unblock mod 60;
                _minutes_to_unblock = (_time_to_unblock - _seconds_to_unblock) / 60;

                if(_minutes_to_unblock < 10) then
                {
                    _minutes_to_unblock_string = format["0%1", _minutes_to_unblock];
                }
                else
                {
                    _minutes_to_unblock_string = format["%1", _minutes_to_unblock];
                };

                if(_seconds_to_unblock < 10) then
                {
                    _seconds_to_unblock_string = format["0%1", _seconds_to_unblock];
                }
                else
                {
                    _seconds_to_unblock_string = format["%1", _seconds_to_unblock];
                };

                _gambling_blockerstatus = _disp displayCtrl 5006;
                if(_time_to_unblock > 0) then
                {
                    _gambling_blockerstatus ctrlSetStructuredText parseText format["%1 %2:%3min", king_gamble_blocked_please_wait, _minutes_to_unblock_string, _seconds_to_unblock_string];
                }
                else
                {
                    _gambling_blockerstatus ctrlSetStructuredText parseText format[""];
                };
            };

            _casino_is_illegal = SEL(king_gamble_casino_is_illegal, king_gamble_casino_idx);
            _jackpot = SEL(king_gamble_jackpot, _casino_is_illegal);
            _gambling_jackpot_text = _disp displayCtrl 5008;
            if(_jackpot != -1) then
            {
                _gambling_jackpot_text ctrlSetStructuredText parseText format["Jackpot: %1€", [_jackpot] call life_fnc_numberText];
            }
            else
            {
                _gambling_jackpot_text ctrlSetStructuredText parseText format[""];
            };

            sleep 1;
        };

        //diag_log format ["%1 ::King:: FINISH LOOP NOW!!!!", time];
        king_gamble_get_data_thread_is_running = 0;
    };
};

//in case of an NPC call we save the casino idx
_npc_paras = [_this,3,-1,[0]] call BIS_fnc_param;
if(_npc_paras != -1) then
{
    king_gamble_casino_idx = _npc_paras;
    king_gamble_npc_name   = _this select 0; //save the calling NPC Name
    //hint format["king_gamble_npc_name=%1", king_gamble_npc_name];
};

//if a gamble is active we don´t want to switch to another
if(king_gamble_roll_time_to_wait > 0) then
{
    _gamble_type = king_gamble_last_type;
}
else
{
    _gamble_type = [_this,0,"",[""]] call BIS_fnc_param;
    if(_gamble_type == "") then
    {
        _gamble_type = "Dice";
    };
};


if(!dialog) then
{
	createDialog "King_gambling";
    king_gamble_roll_timer_is_running = 0;
    _gamble_type = king_gamble_last_type;

    //hide the progressbar and timer
    ctrlShow [5003, false];
    ctrlShow [5005, false];
};

//hint format["king_gamble_casino_is_illegal=%1, king_gamble_casino_idx=%2", king_gamble_casino_is_illegal select king_gamble_casino_idx, king_gamble_casino_idx];

_display = findDisplay 5000;
_gambling_blockerstatus = _display displayCtrl 5006;
_text_your_money = _display displayCtrl 5001;
_dice_rules1 = _display displayctrl 5103;
_dice_rules2 = _display displayctrl 5104;
_bandit_rules1 = _display displayctrl 5204;
_bandit_rules2 = _display displayctrl 5205;
_jackpot_rules = _display displayctrl 5009;

_dice_rules1 ctrlSetStructuredText parseText format["Summe 7 = x%1", king_gamble_dice_win_factor_sum_seven select king_gamble_casino_idx];
_dice_rules2 ctrlSetStructuredText parseText format["6er Pasch = x%1", king_gamble_dice_win_factor_two_of_a_kind select king_gamble_casino_idx];

_bandit_rules1 ctrlSetStructuredText parseText format["zwei Gleiche = x%1", king_gamble_bandit_win_factor_two_of_a_kind select king_gamble_casino_idx];
_bandit_rules2 ctrlSetStructuredText parseText format["drei Gleiche = x%1", king_gamble_bandit_win_factor_three_of_a_kind select king_gamble_casino_idx];

_jackpot_rules ctrlSetStructuredText parseText format["%1", king_gamble_jackpot_rules_text];



if(king_gamble_casino_is_illegal select king_gamble_casino_idx == 0) then
{
    _legal_illegal_text = "legal";
}
else
{
    _legal_illegal_text = "illegal";
};

ctrlSetText[5004, king_gamble_title_text + " [" + _legal_illegal_text + "]"];

_text_your_money ctrlSetStructuredText parseText format["<img size='1.6' image='icons\money.paa'/>€%1",[CASH] call life_fnc_numberText];

//hide all gamble views
ctrlShow [5100, false];
ctrlShow [5200, false];

//show the selected gamble view
switch (_gamble_type) do
{
	case "Dice":
	{
        ctrlShow [5100, true];
    };

	case "einarmiger Bandit":
	{
        ctrlShow [5200, true];
	};
};

king_gamble_last_type = _gamble_type;

