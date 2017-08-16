if (joinmode==0) then {
	_PUID = getPlayerUID player;
	_spielerGeld = argent_liquide;
	hint "Demande envoyee au serveur, merci de patienter...";
	[[_PUID,_spielerGeld],"TON_fnc_paintball",false,false] spawn life_fnc_MP;
	joinmode = 1;
} else {
	hint "Vous avez deja rejoins cette partie";
};