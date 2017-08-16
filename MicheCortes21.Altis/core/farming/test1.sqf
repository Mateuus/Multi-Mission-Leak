//author: Shriver Basdekis 
//Keine Verwendung ohne Erlaubnis... Script für NSGaming

    //IF-Abfragen
	if (playerSide != civilian) exitWith { hint "Du bist kein Zivilist."; };
	if (vehicle player != player) exitWith { hint "Nicht ausm Fahrzeug raus."; };
	if (!alive player) exitWith {};
	if (currentWeapon player != "") exitWith { hint "Du stehst hier mit einer Waffe vor mir ? Pack die sofort weg oder ich ruf die Cops !"; };
	if (life_cash < 35000) exitWith { hint "Ohne Moos nichts los! Du brauchst 35.000€ um hier anbauen zu können. Bei einem disconnect oder Serverneustart verlierst du dein Feld."; };
	_action = _this select 2;
	_unit = _this select 0;
	
_unit removeAction _action;
	
//Geld wech
life_cash = life_cash - 35000;

//Marker für sein Feld - by echo
_Pos = position player; 
_marker = createMarkerLocal ["Marker200", _Pos];
"Marker200" setMarkerColorLocal "ColorRed";
"Marker200" setMarkerTextLocal " ! Dein Feld !";
"Marker200" setMarkerTypeLocal "mil_warning";	
deleteMarkerLocal "feld1";

hint "Du hast das Feld für 10 Minuten gemietet, außerdem solltest du nicht vergessen das es eine 10 Prozentige warscheinlichkeit gibt , bei Illegalentätigkeiten von dem Bestitzer erwischt zu werden. In diesem Fall wird die Polizei informiert!";

    //Actions
	_action = _this select 2;
	_action = f1_mais addAction["Mais pflanzen","core\farming\mais\actionplant.sqf"];
	_action = f1_weizen addAction["Weizen pflanzen","core\farming\weizen\actionplant.sqf"];
	
	//Vlt ne for Schleife machen ?! ^_^ NÖ KEIN BOCK
sleep 60;
	hint "Du hast das Feld für 9 weitere Minuten gemietet!";
	titleText["Du hast das Feld für 9 weitere Minuten gemietet","PLAIN"];
	
	
	_action = f1_mais removeAction _action;
	_action = f1_weizen removeAction _action;

