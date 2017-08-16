private["_preis"];
if(count life_gemaelde < 5) exitWith {hint "Wolfgang Beltracchi will seine 5 Gemälde, sonst macht er nichts!"};

_preis = 0;

{
	switch(_x) do {
		case "Anabolisa": 			{_preis = _preis + 3300000};
		case "Amish Gothic": 		{_preis = _preis + 2950000};
		case "Big Apple": 			{_preis = _preis + 1650000};
		case "Das letzte Moment": 	{_preis = _preis + 1500000};
		case "Das Stilleben": 		{_preis = _preis + 1100000};
		case "Der Schreihals": 		{_preis = _preis + 1350000};
		case "Mandy Warroe": 		{_preis = _preis + 1428500};
		case "Zwei Gesichter": 		{_preis = _preis + 1750000};
		default {hint "Ein Fehler ist aufgetreten"};
	};

} foreach life_gemaelde;

life_gemaelde = [];
life_beatgeld = life_beatgeld + _preis;
titleText [format["Wolfgang Beltracchi hat dir %1€ für deine geklauten Gemälde gegeben!",[_preis] call life_fnc_numbertext],"PLAIN DOWN"];

if(!erfolg_kunstraub) then {erfolg_kunstraub = true; ["erfolg_kunstraub"] spawn life_fnc_erfolgerhalten;};