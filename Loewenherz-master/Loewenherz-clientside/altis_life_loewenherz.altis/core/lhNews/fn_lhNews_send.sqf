/*
    Author: H4SHK3KS (ofpectag: PG)
    File: fn_lhNews_send.sqf

    Description:
    Sends a pirate news to all players

    Parameters:
    None

    Returns:
    Nothing
*/
_message = ctrlText 1400;
if(count _message > 1000) exitWith {
    hint "Sorry, deine Nachricht ist zu lang!";
};

closeDialog 0;
lhm_atmcash = lhm_atmcash - 5000;

[[_message,player],"lhm_fnc_newsBroadcast",false,false] call lhm_fnc_mp;