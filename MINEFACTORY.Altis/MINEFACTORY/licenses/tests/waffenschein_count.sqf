/*

	Author Shinji
	Macht die Zeitliche Begrenzung für den Waffenschein...

*/

waffenschein_best = false;
_timer = 30;
while { !waffenschein_best } do {

	_timer = _timer -1;
	
	if (_timer < 1 ) exitwith {};
	hintsilent format ["Noch %1 Sekunden...", _timer];
	
	sleep 1;

};

if (waffenschein_best) then {

playsound "made_it";
hint "Du hast es geschafft!"; 
license_civ_gun = true;

} else {
hint "Du hast es leider nicht geschafft... Zeit abgelaufen..." 

};
