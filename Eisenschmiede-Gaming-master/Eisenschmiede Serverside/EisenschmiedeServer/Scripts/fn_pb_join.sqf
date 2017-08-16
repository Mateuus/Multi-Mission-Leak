if (CurrentMode == "Altis") then {

	if (joinmode == 0) then {
	    _PUID = getPlayerUID player;
	    _spielerGeld = ES_cash;
	    hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";
	    [[_PUID,_spielerGeld],"ES_fnc_paintball",false,false] spawn ES_fnc_MP;
	    joinmode = 1;
	} else {
	    hint "Du bist der Lobby bereits beigetreten, versuche es sp�ter noch einmal!";
	};
};