#include "..\..\script_macros.hpp"

if ((time - life_last_broadcast) < 2700) exitWith { ["A broadcast was sent within the last 45 minutes.  Try again later.",5,"gray"] call RPG_Fnc_Msg; };
if (CASH < 30000) exitWith { ["You do not have $30,000 in your bank to send a broadcast.",5,"gray"] call RPG_Fnc_Msg;};

CASH = CASH - 30000;

createDialog "life_broadcast_menu";