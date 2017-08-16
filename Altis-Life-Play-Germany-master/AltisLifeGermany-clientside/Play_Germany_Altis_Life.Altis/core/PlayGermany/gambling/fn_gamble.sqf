#include <macro.h>
/*
	File:
	Author: Wolfgang Bahmüller

	Description:
	Casino gamble result processing script

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/

private["_display","_gambling_result","_won","_gamble_val","_gamble_type","_gamble_return","_gamble_win_factor","_watched_gambling","_jackpot_won","_gamble_val_to_jackpot","_jackpot","_casino_is_illegal"];

_display = findDisplay 5000;
_gambling_result = _display displayCtrl 5007;

//check if Display is still open
//if(isNull _display) exitWith {hint "Display is gone...";};
if(isNull _display) exitWith {};

if(king_gamble_player_is_blocked == 1) exitWith
{
    //_gambling_result ctrlSetStructuredText parseText format["You are still blocked time=%1 unblocktime=%2", time, king_gamble_unblock_time];
    //hint format["Blocked!!!!!!!"];
};

if(king_gamble_roll_time_to_wait > 0) exitWith
{
    //hint format["You have gambled too fast! Please wait"];
};

//parse input values
_gamble_type        = [_this,0,"",[""]] call BIS_fnc_param;
_gamble_return      = [_this,1,0,[0]] call BIS_fnc_param;
_gamble_val         = [_this,2,0,[0]] call BIS_fnc_param;
_gamble_win_factor  = [_this,3,0,[0]] call BIS_fnc_param;
_jackpot_won        = [_this,4,0,[0]] call BIS_fnc_param;

//value check
if(_gamble_val > king_gamble_max_bet) exitWith {hint format["%1 %2€", king_gamble_you_cant_gamble_more_then, [king_gamble_max_bet] call life_fnc_numberText];};
if(_gamble_val <= 0) exitwith {hint format["%1", king_gamble_please_enter_a_value_above_zero];};
if(!([str(_gamble_val)] call TON_fnc_isnumber)) exitWith {hint format["%1", king_gamble_this_isnt_an_actual_number_format];};
if(_gamble_val > CASH) exitWith {hint format["%1", king_gamble_not_that_much_money];};
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

//_PG_cash_OLD = PG_cash;

//block the player for gambling and set the time for the next try
king_gamble_player_is_blocked = 1;
king_gamble_unblock_time = time + king_gamble_player_is_blocked_after_gambling;
/*[[0,format["%1 BLOCK gamble 1", time]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;*/


//ANIMTEST
/*
//king_gamble_npc_name playMove "ActsPercMstpSnonWnonDnon_DancingStefan";
king_gamble_npc_name switchMove "AmovPsitMstpSnonWpstDnon_ground";
//TestNPC switchMove "AmovPsitMstpSnonWpstDnon_ground";
king_gamble_npc_name disableAI "Anim";

king_gamble_npc_name enableAI "Anim";
//king_gamble_npc_name playMove "ActsPercSnonWnonDnon_carFixing2";
//king_gamble_npc_name switchMove "AmovPsitMstpSnonWpstDnon_ground";
//TestNPC switchMove "AmovPsitMstpSnonWpstDnon_ground";
//king_gamble_npc_name disableAI "Anim";
*/

//sleep 3.0;
//sleep 3.0;

///////////


if(_won == 1) then
{
    ADD(CASH, _gamble_val);
    [] call life_fnc_hudUpdate;
    if(_jackpot_won == 1) then
    {
        _casino_is_illegal = SEL(king_gamble_casino_is_illegal, king_gamble_casino_idx);
        _jackpot = SEL(king_gamble_jackpot, _casino_is_illegal);

        //The Player gets the Pot!!!
        [[player, SEL(king_gamble_casino_is_illegal, king_gamble_casino_idx)],"king_fnc_gambleJackpotWon",false,false] spawn life_fnc_MP;
        if(king_gamble_send_jackpot_win_to_chat == 1) then
        {
            [[0,format["%1 %2",player GVAR ["realname",name player], king_gamble_send_jackpot_won_to_chat_message]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
        };

        //playSound ["Jackpot",true];
        hint format["%1 %2€", king_gamble_jackpot_won_text, [_jackpot] call life_fnc_numberText];
        _gambling_result ctrlSetStructuredText parseText format["%1 %2€", king_gamble_jackpot_won_text, [_jackpot] call life_fnc_numberText];
    }
    else
    {
        playSound ["Win",true];
        hint format["%1 %2€", king_gamble_won_text, [_gamble_val] call life_fnc_numberText];
        _gambling_result ctrlSetStructuredText parseText format["%1 %2€", king_gamble_won_text, [_gamble_val] call life_fnc_numberText];
    };

    /*
    king_gamble_npc_name enableAI "Anim";
    T1 enableAI "Anim";
    //king_gamble_npc_name enablesimulation true;
    king_gamble_npc_name playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    T1 playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    Player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    zivi1 playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    */
}
else
{
    SUB(CASH, _gamble_val);
    [] call life_fnc_hudUpdate;
    //add the lost money to the jackpot
    _gamble_val_to_jackpot = ceil (_gamble_val * (king_gamble_add_lost_money_to_the_jackpot_percent / 100.0));
    if(_gamble_val_to_jackpot < 1) then
    {
        //in case of a low bid we add min. €1 to the jackpot
        _gamble_val_to_jackpot = 1;
    };
    [[player, _gamble_val_to_jackpot, king_gamble_casino_is_illegal select king_gamble_casino_idx],"king_fnc_gambleJackpotAdd",false,false] spawn life_fnc_MP;

    playSound ["Lost",true];
    hint format["%1 %2€", king_gamble_lost_text, [_gamble_val] call life_fnc_numberText];
    _gambling_result ctrlSetStructuredText parseText format["%1 %2€", king_gamble_lost_text, [_gamble_val] call life_fnc_numberText];

    /*
    king_gamble_npc_name enableAI "Anim";
    T1 enableAI "Anim";
    //king_gamble_npc_name enablesimulation true;
    king_gamble_npc_name playMove "AmovPsitMstpSnonWpstDnon_ground";
    T1 switchMove "AmovPsitMstpSnonWpstDnon_ground";
    Player switchMove "AmovPsitMstpSnonWpstDnon_ground";
    zivi1 playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    */
};


//illegal gambling
if(king_gamble_casino_is_illegal select king_gamble_casino_idx == 1) then
{
    _watched_gambling = random 100;
    if(_watched_gambling < king_gamble_watched_illegal_gambling_percent) then
    {
        playSound ["SirenLong",true];
        [[steamid,player GVAR ["realname",name player],"19"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
        _gambling_result ctrlSetStructuredText parseText format["%1", king_gamble_you_have_been_watched_gambling_illegal];
        //titleText[format["%1", king_gamble_you_have_been_watched_gambling_illegal],"PLAIN"];
        if(king_gamble_send_watched_illegal_gambling_to_chat == 1) then
        {
            [[0,format["%1 %2",player GVAR ["realname",name player], king_gamble_send_watched_illegal_gambling_to_chat_message]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
        };
    };
};

//hint format["Param |%1|, |%2|, |%3|, |%4|, |%5|", _gamble_type, _gamble_return, _gamble_val, _PG_cash_OLD, PG_cash];

//save data to db
[1,false] call SOCK_fnc_updateRequest;

//call the base function again to refresh the ui
[_gamble_type] call king_fnc_gambling;
