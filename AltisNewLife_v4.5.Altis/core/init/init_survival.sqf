[] spawn  {
	private["_fnc_food","_fnc_water","_fnc_battery","_fnc_drug"];
	_fnc_food =
	{
		if(life_hunger < 2) then {player setDamage 1; hint "Vous êtes mort de faim";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint "Vous êtes mort de faim";};
		switch(life_hunger) do {
			case 30: {hint "Vous n'avez rien mangé depuis un certain temps, vous devriez trouver quelque chose à manger !";};
			case 20: {hint "Vous commencez à mourir de faim, vous avez besoin de trouver quelque chose à manger, sinon vous allez mourir !";};
			case 10: {hint "Vous êtes en train de mourir de faim, vous allez mourir très bientôt si vous ne mangez pas quelque chose";player setFatigue 1;};
			};
		};
	};
	_fnc_water =
	{
		if(life_thirst < 2) then {player setDamage 1; hint "Vous êtes mort de soif";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint "Vous êtes mort de soif";};
			switch(life_thirst) do
			{
				case 30: {hint "Vous n'avez rien bu depuis un certain temps, vous devriez trouver quelque chose à boire !";};
				case 20: {hint "Vous commencez à mourir de soif, vous avez besoin de trouver quelque chose à boire, sinon, vous allez mourir"; player setFatigue 1;};
				case 10: {hint "Vous êtes en train de mourir de soif, vous allez mourir très bientôt si vous ne buvez pas quelque chose"; player setFatigue 1;};
			};
		};
	};
	_fnc_battery =
	{
		if(life_battery < 2) then {hint "Votre batterie est vide";}
		else
		{
			life_battery = life_battery - 5;
			[] call life_fnc_hudUpdate;
			if(life_battery < 2) then {hint "Votre batterie est vide";};
			switch(life_battery) do
			{
				case 30: {hint "Votre batterie est a 30%.";};
				case 20: {hint "Votre batterie est faible plus que 20%.";};
				case 10: {hint "Recharger votre telephone, il ne vous reste plus que 10%.";};
			};
		};
	};
	/*
	_fnc_drug =
	{
		if ((life_drink > 0) || (life_drug > 0)) then {
			if(life_drink <= 0.02) then {life_drink = 0.00;} else {life_drink = life_drink - 0.02;};
			if(life_drug <= 0.02) then {life_drug = 0.00;} else {life_drug = life_drug - 0.02;};
			[] call life_fnc_hudUpdate;
			};
	};
	*/
	while{true} do
	{
		uiSleep 500;
		[] call _fnc_water;
		uiSleep 300;
		[] call _fnc_battery;
		uiSleep 200;
		[] call _fnc_food;
		/*
		uiSleep 200;
		[] call _fnc_drug;
		*/
	};
};
[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		//if (backpack player == "B_AssaultPack_blk") then { _load =40; };
		//if (backpack player == "B_Kitbag_cbr") then { _load =40; };
		//if (backpack player == "B_Kitbag_mcamo") then { _load =40; };
		//if (backpack player == "B_UAV_01_backpack_F") then { _load =40; };
		life_maxWeight = life_maxWeightT + _load;
		if(playerSide == west) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		if(playerSide == Independent) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		waitUntil {backpack player != _bp};
		if(backpack player == "") then
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};
[] spawn
{
	while {true} do
	{
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Vous êtes surchargé, vous ne pouvez plus courir ou bouger rapidement à moins de lacher quelques objets !";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};
[] spawn
{
	while{true} do
	{
		private["_oldDamage","_damage","_pain"];
		_oldDamage = damage player;
		waitUntil {_oldDamage != damage player};

		if (_oldDamage != damage player) then
		{
			_damage = (damage player) - _oldDamage;
			if (_damage > 0.3) then
			{
				_pain = (life_pain + _damage);
				if (_pain > 1) then { _pain = 1; };
				[_pain] spawn life_fnc_setPain;
			};
		};
	};
};
[] spawn
{
	while {true} do
	{
		private["_damage"];
		uiSleep 60;
		while {((player distance (getMarkerPos "Warm_Marker") < 250) && (player getvariable["Revive",TRUE]))} do
		{
			if(uniform player == "U_C_Scientist") then
			{
				hint "!!! Tu es dans une zone radioactive !!! Mais ta combinaison te protège";
				uiSleep 60;
			}else
			{
				hint "!!! ATTENTION TU ES DANS UNE ZONE RADIOACTIVE !!! Tu risque de mourir si tu n'es pas protégé";
				_damage = damage player;
				_damage = _damage + 0.2;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				uiSleep 10;
			};
		};
	};
};