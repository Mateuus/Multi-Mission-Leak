[] spawn  {
	private["_fnc_food","_fnc_water"];
	zuschauer = false;
	if (isNil "DWEV_paintball") then {DWEV_paintball = false;};
	
	player setDamage 0.00; // Spieler nach dem Spawn auf 100% Leben stellen
	
	_fnc_food = 
	{
		if(DWEV_hunger < 2) then {player setDamage 1; hint "Du bist verhungert.";}
		else
		{
		DWEV_hunger = DWEV_hunger - 10;
		
			switch(DWEV_hunger) do 
			{
				case 30: {hint "Du hast eine Weile nichts mehr gegessen, du solltest dies bald nachholen!";};
				case 20: {hint "Du fängst an zu verhungern, such dir schnell etwas zu Essen.";};
				case 10: {hint "Du verhungerst, bald wirst du sterben, wenn du nicht sofort etwas zu Essen findest.";player setFatigue 1;};
				case 0: {hint "Du verhungerst, bald wirst du sterben, wenn du nicht sofort etwas zu Essen findest.";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(DWEV_thirst < 2) then {player setDamage 1; hint "Du bist Verdurstet.";}
		else
		{
			DWEV_thirst = DWEV_thirst - 10;
			
			switch(DWEV_thirst) do 
			{
				case 30: {hint"Du hast eine Weile nichts mehr getrunken, du solltest dies bald nachholen!";};
				case 20: {hint "Du fängst an zu verdursten, such dir schnell etwas zu Trinken!"; player setFatigue 1;};
				case 10: {hint "Du verdurstest, bald wirst du durch Dehydration sterben, wenn du nicht sofort etwas zu Trinken findest."; player setFatigue 1;};
				case 0: {hint "Du verdurstest, bald wirst du durch Dehydration sterben, wenn du nicht sofort etwas zu Trinken findest."; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		sleep 1;
		if (!zuschauer && !DWEV_paintball) then  // Deaktivieren wenn Admin im Zuschauermodus ist Und der Spieler sich nicht in der Paintball arena befindet
		{
			sleep 600;
			[] call _fnc_water;
			sleep 250;
			[] call _fnc_food;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep (45*60);
		if (player getVariable["verwarnungen_vdm",0] > 0) then
		{
			_warns = player getVariable["verwarnungen_vdm",0];
			_warns = _warns - 1;
			player setVariable["verwarnungen_vdm",_warns];
		};
	};
};

[] spawn // Rucksack verarbeitung
{
	private["_bp","_load","_cfg"];
	
	_w40Backpacks = 
	[
		"B_Carryall_cbr",
		"B_AssaultPack_blk",
		"B_AssaultPack_cbr",
		"B_AssaultPack_khk",
		"B_AssaultPack_dgtl",
		"B_AssaultPack_rgr",
		"B_AssaultPack_sgg",
		"B_AssaultPack_mcamo",
		"B_AssaultPack_ocamo",
		"B_Kitbag_rgr",
		"B_Kitbag_mcamo",
		"B_Kitbag_sgg",
		"B_Kitbag_cbr",
		"B_Bergen_sgg",
		"B_Bergen_mcamo",
		"B_Bergen_rgr",
		"B_Bergen_blk",
		"B_ViperLightHarness_khk_F",
		"B_ViperLightHarness_blk_F",
		"B_ViperLightHarness_hex_F",
		"B_ViperLightHarness_oli_F",
		"B_ViperLightHarness_ghex_F",
		"B_ViperHarness_oli_F",
		"B_ViperHarness_khk_F",
		"B_ViperHarness_ghex_F",
		"B_ViperHarness_blk_F",
		"B_ViperHarness_hex_F",
		"B_Carryall_ghex_F",
		"B_FieldPack_ghex_F",
		"B_AssaultPack_tna_F"
	];

	_w60Backpacks = 
	[
		"B_Bergen_dgtl_F"
	];
	
	_w80Backpacks =
	[
		"B_Bergen_mcamo_F",
		"B_Bergen_tna_F",
		"B_Bergen_hex_F"
	];
	
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		
		if((side player) == west || (side player) == east) then {(unitBackpack player) setObjectTextureGlobal [0,""];}; // Cop rucksack unsichtbar
		// für alle Fraktionen
		if (backpack player IN _w40Backpacks ) then { _load = 40; };
		if (backpack player IN _w60Backpacks ) then { _load = 60; };
		if (backpack player IN _w80Backpacks ) then { _load = 80; };
		
		// einschränkungen
		if (backpack player == "B_Parachute") then { _load = 0; };

		DWEV_maxWeight = DWEV_maxWeightT + _load;
		waitUntil {sleep 1; backpack player != _bp};
		if(backpack player == "") then 
		{
			DWEV_maxWeight = DWEV_maxWeightT;
		};
	};
};

[] spawn // Spieler trägt zuviel
{
	while {true} do
	{
		sleep 1.5;
		if(DWEV_carryWeight > DWEV_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Du trägst zuviel, wenn du nicht etwas abwirfst wirst du dich nicht schnell bewegen können!";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	// testem	
//		if(cameraView == "GROUP" && alive player) then {
//			(vehicle player) switchCamera "EXTERNAL";
//		};
	// ende
	};
};

[] spawn  // Wie weit ist der Spieler unterwegs ?
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 120; // Da Zeitfaktor *10 Muss dass natürlich auch 1200 / 10 sein
	while{true} do 
	{
		sleep 5; // Das muss nicht alle 0.5 Sekunden laufen
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					DWEV_thirst = DWEV_thirst - 5;
					DWEV_hunger = DWEV_hunger - 5;
					
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn  // Hat der Spieler eine Niere ?
{
	while{true} do
	{
		waitUntil {sleep 2;(player getVariable "missingOrgan")}; // Das reicht locker alle 2 Sekunden
		DWEV_max_health = 0.50;
		while{(player getVariable "missingOrgan")} do {
			DWEV_thirst =  50;
			DWEV_hunger =  50;
			if(damage player < (1 - DWEV_max_health)) then {player setDamage (1 - DWEV_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		DWEV_max_health = 1;
	};
};

[] spawn // Spieler trägt Uranium
{
	while {true} do 
	{
		sleep 3; //Prüfung alle 3 Sekunden Reicht
		if(DWEV_inv_uranium2 != 0) then 
		{
			player forceWalk true;
			player setFatigue 1;
			hint "Mit Roh-Uranium kannst du nicht laufen!";
		} 
		else 
		{
			if(isForcedWalk player) then 
			{
				player forceWalk false;
			};
		};
	};
};

switch (worldName) do 
{
	case "Altis":
	{
		[] spawn // Radioaktive Zone
		{
			while {true} do
			{
				private["_damage"];
				sleep 10; // Kann ruhig alle 10 Sekunden sein
				while {((player distance (getMarkerPos "uran_1") < 150) && (alive player))} do
				{
					if(uniform player == "U_C_Scientist") then
					{
						hint "!!! Du bist in einer radioaktiven Zone !!! Durch deinen Schutzanzug bist du sicher vor der Strahlung!";
						sleep 30; // Spieler hat den Anzug ja an, dass müssen wir nicht so oft prüfen
					}
					else
					{
						hint "!!! Du bist in einer radioaktiven Zone !!! Ohne Schutzanzug wirst du sterben!";
						_damage = damage player;
						_damage = _damage + 0.1;
						player setDamage (_damage);
						
						sleep 5;
					};
				};
			};
		};
	};

	case "Tanoa":
	{
	};
	
};