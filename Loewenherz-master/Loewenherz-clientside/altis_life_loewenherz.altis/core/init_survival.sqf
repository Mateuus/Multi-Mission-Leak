// wait a litte bit...
sleep 2;

hud_lhmHealth = [] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food =
	{
		if(lhm_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		lhm_hunger = lhm_hunger - 10;
		[] call lhm_fnc_hudUpdate;
		if(lhm_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(lhm_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};

	_fnc_water =
	{
		if(lhm_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			lhm_thirst = lhm_thirst - 10;
			[] call lhm_fnc_hudUpdate;
			if(lhm_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(lhm_thirst) do
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		sleep 240;
		[] call _fnc_water;
		sleep 360;
		[] call _fnc_food;
	};
};

hud_lhmWeight = [] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		lhm_maxWeight = lhm_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then
		{
			lhm_maxWeight = lhm_maxWeightT;
		};
	};
};

hud_lhmStamina = [] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(lhm_carryWeight > lhm_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

hud_lhmRun = [] spawn
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do
	{
		sleep 0.5;
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
					lhm_thirst = lhm_thirst - 5;
					lhm_hunger = lhm_hunger - 5;
					[] call lhm_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

//Alcohol
hud_lhmAlcohol = [] spawn
{
	while {true} do
	{
		waitUntil {sleep 2;(lhm_drink > 0)};
		while{(lhm_drink > 0)} do {

			if(lhm_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			sleep 240;
			lhm_drink = lhm_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			lhm_drink = lhm_drink - 0.02;
			};
		};

		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		lhm_drink = 0;

	};
};

// LHM BUFFS
hud_lhmBuffs = [] spawn
{
	private["_dam","_hungerP","_thirstP","_adrenbuff","_hpregbuff","_SoylentGreenBuff"];
	_dam = damage player;
	_hungerP = lhm_hunger;
	_thirstP = lhm_thirst;
	if (LHM_AdrenalinBuffTimer > 60) then {
		_adrenbuff = floor (LHM_AdrenalinBuffTimer / 60);
	} else {
		_adrenbuff = LHM_AdrenalinBuffTimer;
	};
	if (LHM_NanoBotsBuffTimer > 60) then {
		_hpregbuff = floor (LHM_NanoBotsBuffTimer / 60);
	} else {
		_hpregbuff = LHM_NanoBotsBuffTimer;
	};
	if (LHM_SoylentGreenBuffTimer > 60) then {
		_SoylentGreenBuff = floor (LHM_SoylentGreenBuffTimer / 60);
	} else {
		_SoylentGreenBuff = LHM_SoylentGreenBuffTimer;
	};

	while {true} do
	{
		[] call lhm_fnc_hudUpdate;

		if (((damage player) != _dam) || (LHM_AdrenalinBuffTimer != _adrenbuff) || (LHM_NanoBotsBuffTimer != _hpregbuff) || (LHM_SoylentGreenBuffTimer != _SoylentGreenBuff) || (lhm_hunger != _hungerP) || (lhm_thirst != _thirstP)) then {
			_dam = damage player;
			if (LHM_AdrenalinBuffTimer > 60) then {
				_adrenbuff = floor (LHM_AdrenalinBuffTimer / 60);
			} else {
				_adrenbuff = LHM_AdrenalinBuffTimer;
			};
			if (LHM_NanoBotsBuffTimer > 60) then {
				_hpregbuff = floor (LHM_NanoBotsBuffTimer / 60);
			} else {
				_hpregbuff = LHM_NanoBotsBuffTimer;
			};
			if (LHM_SoylentGreenBuffTimer > 60) then {
				_SoylentGreenBuff = floor (LHM_SoylentGreenBuffTimer / 60);
			} else {
				_SoylentGreenBuff = LHM_SoylentGreenBuffTimer;
			};
			_hungerP = lhm_hunger;
			_thirstP = lhm_thirst;
		};
		sleep 0.1;
	};
};