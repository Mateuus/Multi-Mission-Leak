
if(life_battery >= 100) exitWith {hint "Dein Smartphone ist bereits vollständig aufgeladen!"};
if!(isEngineOn (vehicle player)) exitWith {hint "Du musst zuerst den Motor einschalten!"};
if(life_aufladen) exitWith {hint "Du lädst dein Smartphone bereits auf!"};
life_aufladen = true;

hint "Dein Smartphone wird nun aufgeladen...";
while{true} do {

	if(life_battery >= 100) exitWith {life_battery = 100; [] call life_fnc_hudUpdate; hint "Smartphone vollständig aufgeladen!"};
	if(isNull objectParent player) exitWith {life_aufladen = false;};
	if!(isEngineOn (vehicle player)) exitWith {life_aufladen = false;};
	sleep 60;
	
	life_battery = life_battery + 1;
	[] call life_fnc_hudUpdate;
};