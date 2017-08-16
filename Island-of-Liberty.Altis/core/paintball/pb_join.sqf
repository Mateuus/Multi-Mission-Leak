#include "..\..\script_macros.hpp"
if (joinmode==0) then {
_PUID = getPlayerUID player;
_spielerGeld = life_cash;
hint "Eine Event anfrage wurde an den Server gesendet, bitte warte einen Moment";
[_PUID,_spielerGeld] remoteExec ["TON_fnc_paintball",RSERV];
joinmode = 1;
} else {
hint "Du bist bereits dem Event beigetreten, oder versuche es zu einem anderen Zeitpunkt noch einmal!";
};