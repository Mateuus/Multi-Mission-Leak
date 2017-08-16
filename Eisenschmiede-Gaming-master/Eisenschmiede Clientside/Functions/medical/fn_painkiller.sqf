#include "..\script_macros.hpp"

private["_strength","_dmg","_healing","_count","_costs","_text","_drugged"];

_strength = _this select 0;
_dmg = 0.00;
_healing = 0.00;
_count = 0;
_text = "";
_costs = 0;
_drugged = 0;

switch (_strength) do
{
	case 1: {_healing = 0.0025;_text = "leichte"; _costs = 500; _drugged = 1;};
	case 2: {_healing = 0.005;_text = "mittelstarke"; _costs = 5000; _drugged = 2;};
	case 3: {_healing = 0.01;_text = "starke"; _costs = 15000; _drugged = 4;};
};

if((ES_drugged + _drugged) > 12) exitWith{hint "Dir konnte kein Schmerzmittel verschrieben werden, da du schon zuviel Medikamente bekommen hast.";};

if((ES_cash - _costs) < 0) then 
{
	if((ES_atmbank - _costs) < 0) then
	{
		hint "Da du kein Geld für Schmerzmittel hast, zahlt das Krankenhaus aus Kullanz deine Rechnung.";
	} else {
		ES_atmbank = ES_atmbank - _costs;
	};
} else {
	ES_cash = ES_cash - _costs;
};

Hint format["Du hast gerade %1 Schmerzmittel bekommen und dafür %2$ bezahlt.",_text,_costs];
ES_drugged = (ES_drugged + _drugged);

while{true}do
{

	_dmg = damage player;

	if(_dmg > 0) then 
	{
		player setDamage (_dmg - _healing);
	};
	_count = _count + 1;
	sleep 1;
	if(_count >= 120) exitWith{};
};

Hint "Dein Schmerzmittel wirkt nicht mehr!";
ES_drugged = (ES_drugged - _drugged);