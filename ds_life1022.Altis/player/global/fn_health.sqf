/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	All things relating to a players general well being (Thirst, Hunger etc)
*/

	private ["_hunger","_thirst","_overLoaded","_nightStalker","_nightStalkerThermal","_backPack","_sickness"];
	_hunger =
	{

		if(((headgear player) in ["H_PilotHelmetFighter_B","H_PilotHelmetFighter_I"])&&(!((vehicle player) isKindOf "Air")))then
			{
			_random = random 1;
			_damage = (damage player);
			_random = _damage - _random;
			if(_random < 0.1)then
				{
				player setDamage 0.9;
				}
				else
				{
				player setDamage _damage;
				};
			titleText [" !! ~~ You're losing health because you're wearing an oxygen mask when it is not needed ~~ !! ","PLAIN"];
			hint "You're losing health because you're wearing an oxygen mask when it is not needed";
			titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];
			};

		if(DS_hunger < 2)then
			{
			DS_hunger = 0;hint "You are so hungry that you can hardly move";player setDamage 0.5;
			}
			else
			{
			if(DS_medicRevived)then
				{
				DS_hunger = DS_hunger - (3 + (round random 2));
				}
				else
				{
				DS_hunger = DS_hunger - (7 + (round random 5));
				};
			if(DS_hunger < 2)then
				{
				DS_hunger = 0;hint "You are so hungry that you can hardly move";player setDamage 0.5;
				}
				else
				{
				if(DS_hunger < 10)then
					{
					hint "You're getting very hungry, you better eat soon!";player setDamage 0.2;
					}
					else
					{
					if(DS_hunger < 30)then
						{
						hint "You are getting hungry, you might want to have something to eat soon";
						};
					};
				};
			};
			[]call DS_fnc_updateHud;
	};
	_thirst =
	{
		if(DS_thirst < 2) then
			{
			DS_thirst = 0;hint "You are so thirsty that you can hardly move";player setDamage 0.5;
			}
			else
			{
			if(DS_armour > 0)then
				{
				if((DS_infoArray select 13) > 45)then
					{
					DS_thirst = DS_thirst - (5 + (round random 5));
					}
					else
					{
					DS_thirst = DS_thirst - (10 + (round random 20));
					};
				}
				else
				{
				if((DS_infoArray select 13) > 45)then
					{
					DS_thirst = DS_thirst - (4 + (round random 3));
					}
					else
					{
					DS_thirst = DS_thirst - (8 + (round random 10));
					};
				};
			if(DS_thirst < 2) then
				{
				DS_thirst = 0;hint "You are so thirsty that you can hardly move";player setDamage 0.5;
				}
				else
				{
				if(DS_thirst < 10)then
					{
					hint "You're getting very thirsty, you need a drink badly";player setDamage 0.2;
					}
					else
					{
					if(DS_thirst < 30)then
						{
						hint "You're getting quite thirsty, you better grab a drink";player setDamage 0.02;
						};
					};
				};
			};
			[]call DS_fnc_updateHud;
			[] call _sickness;
	};
	_overLoaded =
	{
		waitUntil{((DS_currentWeight > DS_maxWeight)&&(!isForcedWalk player))};
		player forceWalk true;
		player enableFatigue true;
		sleep 0.5;
		player setFatigue 1;
		hintsilent "You are carrying over your max weight";
		waitUntil{((DS_currentWeight <= DS_maxWeight)&&(isForcedWalk player))};//Check this out... Saturday... 29/8/15
		player forceWalk false;
		player setFatigue 0;
		sleep 0.5;
		player enableFatigue false;
	};
	_nightStalker =
	{
		private["_nightStalkerThermal","_stalker","_battery","_cfg"];
		_nightStalkerThermal =
			{
				private["_stalker","_battery","_cfg"];
				waitUntil {(isNull objectParent player)&&((currentVisionMode player) == 2)};
				_stalker = (primaryWeaponItems player select 2);
				if(_stalker == "optic_Nightstalker")then
					{
					player removePrimaryWeaponItem _stalker;
					player addItem _stalker;
					player say3D "fail";
					hint "You are not allowed to use thermal vision on this scope, the scope has been removed and added to your backpack";
					systemchat "You are not allowed to use thermal vision on this scope, the scope has been removed and added to your backpack";
					};
			};
		while{true}do
			{
			waitUntil {(((primaryWeaponItems player select 2) == "optic_Nightstalker")&&(alive player))};
			[] spawn _nightStalkerThermal;
			_stalker = (primaryWeaponItems player select 2);
			_battery = if(DS_item_battery > 0)then{true}else{false};
			//_distance = if(player distance shawn1 < 2000)then{true}else{false};

			if(!_battery)then
				{
				hint "WARNING - Your night stalker scope will be destroyed if you do not remove it immediately. This scope requires a battery in you Y inventory to operate.";
				systemchat "WARNING - Your night stalker scope will be destroyed if you do not remove it immediately. This scope requires a battery in you Y inventory to operate.";
				player say3D "fail";
				sleep 10;
				hint "WARNING - Your night stalker scope will be destroyed if you do not remove it immediately. This scope requires a battery in you Y inventory to operate.";
				systemchat "WARNING - Your night stalker scope will be destroyed if you do not remove it immediately. This scope requires a battery in you Y inventory to operate.";
				player say3D "fail";
				sleep 5;
				if(((primaryWeaponItems player select 2) == "optic_Nightstalker")&&((DS_item_battery == 0)))then
					{
					player removePrimaryWeaponItem _stalker;
					hint "Your night stalker has been destroyed because you tried using it without a battery or in the wrong area";
					systemchat "Your night stalker has been destroyed because you tried using it without a battery or in the wrong area";
					player say3D "fail";
					};
				};
			waitUntil {((DS_item_battery == 0)||((primaryWeaponItems player select 2) != "optic_Nightstalker"))};
			};
	};
	_backpack =
	{
		private["_bp","_load","_cfg"];
		while{true} do
		{
			waitUntil {backpack player != ""};
			_bp = backpack player;
			_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
			_load = round(_cfg / 8);
			DS_maxWeight = (24 + _load);
			if(playerSide isEqualTo west)then
				{
				if(DS_copLevel > 8)then{DS_maxWeight = DS_maxWeight + 20};
				};
			if(!(playerSide isEqualTo civilian)) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
			waitUntil {backpack player != _bp};
			if(backpack player == "") then
			{
				DS_maxWeight = 24;
			};
		};
	};
	_sickness =
	{
		private ["_random"];
		player forceWalk false;
		player enableFatigue false;
		if(player getVariable ["DS_sick_infection",false])then
			{
			titleText ["You're infected, get treated at a hospital or by a Medic","PLAIN"];
			systemchat "You're infected, get treated at a hospital or by a Medic";
			hint "You're infected, get treated at a hospital or by a Medic";
			_random = round random 4;
			switch(_random)do
				{
				case 0:
					{
					titleCut ["","WHITE OUT",0];
					[player,"vomit"] call DS_fnc_playSounds;
					sleep 2;
					titleCut ["","WHITE IN",0];
					};
				case 1:
					{
					player forceWalk true;
					[player,"sickCough"] call DS_fnc_playSounds;
					player setDamage 0.3;
					sleep 30;
					player forceWalk false;
					};
				case 2:
					{
					player enableFatigue true;
					sleep 0.5;
					player setFatigue 1;
					[player,"fart3"] call DS_fnc_playSounds;
					sleep 30;
					player setFatigue 0;
					sleep 0.5;
					player enableFatigue false;
					};
				case 3:
					{
					[player,"burp1"] call DS_fnc_playSounds;
					player setDamage 0.5;
					};
				case 4:
					{
					[player,"vomit"] call DS_fnc_playSounds;
					player setDamage 0.9;
					};
				};
			};
	};

[] spawn _backPack;
[] spawn _nightStalker;
[] spawn _overLoaded;
while{true}do
	{
	sleep (300 + random 100);
	if(player distance spawnIsland > 1000)then
		{
		[] call _hunger;
		};
	sleep (250 + random 200);
	if(player distance spawnIsland > 1000)then
		{
		[] call _thirst;
		};
	};