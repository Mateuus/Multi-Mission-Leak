
_action = [
	"Möchtest du wirklich Fallschirmspringen? Lege deinen Rucksack besser ins Auto! Der Fallschirmsprung kostet 2.000€!",
	"Fallschirmspringen?",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	if (life_beatgeld < 2000) exitwith {hint "Du benötigst 2.000€ für einen Sprung!"};
	if(life_inTime) exitWith {hint "Don Ator hat derzeitig leider keinen Fallschirm für dich. Komm später nochmal wieder!"};

	life_inTime = true;
	life_beatgeld = life_beatgeld - 2000;
	player addBackpack "B_Parachute";
	sleep 1;
	0 cutText ["10 Minuten später...","BLACK OUT",3];
	playsound "plane";
	sleep 5;
	0 cutFadeOut 2;
	playsound "geronimo";
	player setPos [getPos player select 0, getPos player select 1, 1500];

	sleep (10 * 60);
	life_inTime = false;
};