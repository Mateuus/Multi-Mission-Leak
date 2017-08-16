/*
    Author: H4SHK3KS (ofpectag: PG)
    File: fn_lhNews_action.sqf

    Description:
    Starts the pirate news action

    Parameters:
    None

    Returns:
    Nothing
*/
_npc = param [0,objNull,[objNull]];
if(isNull _npc) exitWith {};

if (lhm_atmcash < 5000) exitWith
{
	hint"Du brauchst $5.000 um eine Nachricht zu schicken!";
};

if (lhNews_MessageOn) exitWith {
	Hint "Du kannst aktuell keine Nachricht verschicken!\nDer Satellit ist außer Reichweite...!";
};

createDialog "lh_NewsFlash";