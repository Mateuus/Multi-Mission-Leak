
if ((eM_joinmode == 0) && !(side player in [east,civilian])) exitWith {hint "Komm in deiner Freizeit wieder ;)"; closeDialog 0;};
if (eM_joinmode == 0) then {
    _PUID = getPlayerUID player;
    hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";
    [[_PUID],"TON_fnc_paintball",false,false] call EMonkeys_fnc_MP;
	[] call EMonkeys_fnc_saveGear;
    eM_joinmode = 1;
} else {
    hint "Du bist der Lobby bereits beigetreten, versuche es später noch einmal!";
};