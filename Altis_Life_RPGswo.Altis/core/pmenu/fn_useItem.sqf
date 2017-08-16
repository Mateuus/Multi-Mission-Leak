/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item","_shotstufe","_kraftstufe","_zuckerstufe","_kevlarstufe"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Du musst ein Gegenstand auswählen!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "boltcutter"): 
	{
		[cursorTarget] spawn DWEV_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): 
	{
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn DWEV_fnc_blastingCharge;
		closeDialog 0;
	};
	 
	case (_item == "nitro"):
	{
		if((side player) in [west,independent,east]) exitWith {hint "Du bist kein Zivilist.";};
		[] spawn DWEV_fnc_nos;
		closeDialog 0;
	};
	
	case (_item == "nitrov2"):
	{
		if((side player) in [west,independent,east]) exitWith {hint "Du bist kein Zivilist.";};
		[] spawn DWEV_fnc_nosv2;
		closeDialog 0;
	};

	case (_item == "defusekit"): 
	{
		[cursorTarget] spawn DWEV_fnc_defuseKit;
		closeDialog 0;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call DWEV_fnc_handlelnv)) then
		{
			DWEV_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				DWEV_redgull_effect = time;
				titleText["Für 3 Minuten kannst du nun Dauerlaufen.","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - DWEV_redgull_effect) > (3 * 60))};
				player enableFatigue true;
				closeDialog 0;
			};
		};
	};
	
	case (_item == "kevlar"):
	{
		if(DWEV_var_kevlar >= 1) exitWith {hint "Du hast schon Kevlar benutzt."};
		if (isNil "DWEV_var_kevlar") then {DWEV_var_kevlar = 0;};
		_kevlarstufe = round(random 5);
		switch (_kevlarstufe) do
		{
			case 0: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_kevlar_effect = time;
							DWEV_var_kevlar = (DWEV_var_kevlar + 6);
							hint "Für eine Minute bekommst du nur noch 10 Schaden pro Geschoss-Kugel die dich trifft.";
							waitUntil {!alive player OR ((time - DWEV_kevlar_effect) > (1 * 60))};
							DWEV_var_kevlar = 0;
							titleText["Dein Kevlar ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 1:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_kevlar_effect = time;
							DWEV_var_kevlar = (DWEV_var_kevlar + 1);
							hint "Für eine Minute bekommst du nur noch 14 Schaden pro Geschoss-Kugel die dich trifft.";
							waitUntil {!alive player OR ((time - DWEV_kevlar_effect) > (1 * 60))};
							DWEV_var_kevlar = 0;
							titleText["Dein Kevlar ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 2:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_kevlar_effect = time;
							DWEV_var_kevlar = (DWEV_var_kevlar + 2);
							hint "Für eine Minute bekommst du nur noch 16 Schaden pro Geschoss-Kugel die dich trifft.";
							waitUntil {!alive player OR ((time - DWEV_kevlar_effect) > (1 * 60))};
							DWEV_var_kevlar = 0;
							titleText["Dein Kevlar ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 3:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_kevlar_effect = time;
							DWEV_var_kevlar = (DWEV_var_kevlar + 3);
							hint "Für eine Minute bekommst du nur noch 18 Schaden pro Geschoss-Kugel die dich trifft.";
							waitUntil {!alive player OR ((time - DWEV_kevlar_effect) > (1 * 60))};
							DWEV_var_kevlar = 0;
							titleText["Dein Kevlar ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 4:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_kevlar_effect = time;
							DWEV_var_kevlar = (DWEV_var_kevlar + 4);
							hint "Für eine Minute bekommst du nur noch 20 Schaden pro Geschoss-Kugel die dich trifft.";
							waitUntil {!alive player OR ((time - DWEV_kevlar_effect) > (1 * 60))};
							DWEV_var_kevlar = 0;
							titleText["Dein Kevlar ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 5: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_kevlar_effect = time;
							DWEV_var_kevlar = (DWEV_var_kevlar + 5);
							hint "Für eine Minute bekommst du nur noch 12 Schaden pro Geschoss-Kugel die dich trifft.";
							waitUntil {!alive player OR ((time - DWEV_kevlar_effect) > (1 * 60))};
							DWEV_var_kevlar = 0;
							titleText["Dein Kevlar ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
		};
	};

	case (_item == "traubenzucker"):
	{
		if(DWEV_var_traubenzucker >= 1) exitWith {hint "Du hast schon Traubenzucker zu dir genommen."};
		if (isNil "DWEV_var_traubenzucker") then {DWEV_var_traubenzucker = 0;};
		_zuckerstufe = round(random 5);
		switch (_zuckerstufe) do
		{
			case 0: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_traubenzucker_effect = time;
							DWEV_var_traubenzucker = (DWEV_var_traubenzucker + 6);
							hint "Für 15 Minuten kannst du nun 50% schneller verarbeiten.";
							waitUntil {!alive player OR ((time - DWEV_traubenzucker_effect) > (15 * 60))};
							DWEV_var_traubenzucker = 0;
							titleText["Dein Traubenzucker ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 1:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_traubenzucker_effect = time;
							DWEV_var_traubenzucker = (DWEV_var_traubenzucker + 1);
							hint "Für 15 Minuten kannst du nun 15% schneller verarbeiten.";
							waitUntil {!alive player OR ((time - DWEV_traubenzucker_effect) > (15 * 60))};
							DWEV_var_traubenzucker = 0;
							titleText["Dein Traubenzucker ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 2:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_traubenzucker_effect = time;
							DWEV_var_traubenzucker = (DWEV_var_traubenzucker + 2);
							hint "Für 15 Minuten kannst du nun 20% schneller verarbeiten.";
							waitUntil {!alive player OR ((time - DWEV_traubenzucker_effect) > (15 * 60))};
							DWEV_var_traubenzucker = 0;
							titleText["Dein Traubenzucker ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 3:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_traubenzucker_effect = time;
							DWEV_var_traubenzucker = (DWEV_var_traubenzucker + 3);
							hint "Für 15 Minuten kannst du nun 25% schneller verarbeiten.";
							waitUntil {!alive player OR ((time - DWEV_traubenzucker_effect) > (15 * 60))};
							DWEV_var_traubenzucker = 0;
							titleText["Dein Traubenzucker ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 4:
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_traubenzucker_effect = time;
							DWEV_var_traubenzucker = (DWEV_var_traubenzucker + 4);
							hint "Für 15 Minuten kannst du nun 30% schneller verarbeiten.";
							waitUntil {!alive player OR ((time - DWEV_traubenzucker_effect) > (15 * 60))};
							DWEV_var_traubenzucker = 0;
							titleText["Dein Traubenzucker ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 5: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{				
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						[] spawn
						{
							DWEV_traubenzucker_effect = time;
							DWEV_var_traubenzucker = (DWEV_var_traubenzucker + 5);
							hint "Für 15 Minuten kannst du nun 40% schneller verarbeiten.";
							waitUntil {!alive player OR ((time - DWEV_traubenzucker_effect) > (15 * 60))};
							DWEV_var_traubenzucker = 0;
							titleText["Dein Traubenzucker ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
		};
	};
	
	case (_item == "redshot"):
	{
		if(DWEV_redshot_aktiv) exitWith {hint "Du hast schon ein EnergyShot getrunken."};
		_shotstufe = round(random 5);
		
		switch (_shotstufe) do
		{
			case 0: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						player setFatigue 0;
						[] spawn
						{
							DWEV_redshot_effect = time;
							DWEV_redshot_aktiv = true;
							hint "Für 20 Minuten kannst du nun Dauerlaufen.";
							player enableFatigue false;
							waitUntil {!alive player OR ((time - DWEV_redshot_effect) > (20 * 60))};
							player enableFatigue true;
							DWEV_redshot_aktiv = false;
							titleText["Dein EnergyShot ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 1:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						player setFatigue 0;
						[] spawn
						{
							DWEV_redshot_effect = time;
							DWEV_redshot_aktiv = true;
							hint "Für 3 Minuten kannst du nun Dauerlaufen.";
							player enableFatigue false;
							waitUntil {!alive player OR ((time - DWEV_redshot_effect) > (3 * 60))};
							player enableFatigue true;
							DWEV_redshot_aktiv = false;
							titleText["Dein EnergyShot ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 2:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						player setFatigue 0;
						[] spawn
						{
							DWEV_redshot_effect = time;
							DWEV_redshot_aktiv = true;
							hint "Für 5 Minuten kannst du nun Dauerlaufen.";
							player enableFatigue false;
							waitUntil {!alive player OR ((time - DWEV_redshot_effect) > (5 * 60))};
							player enableFatigue true;
							DWEV_redshot_aktiv = false;
							titleText["Dein EnergyShot ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 3:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						player setFatigue 0;
						[] spawn
						{
							DWEV_redshot_effect = time;
							DWEV_redshot_aktiv = true;
							hint "Für 10 Minuten kannst du nun Dauerlaufen.";
							player enableFatigue false;
							waitUntil {!alive player OR ((time - DWEV_redshot_effect) > (10 * 60))};
							player enableFatigue true;
							DWEV_redshot_aktiv = false;
							titleText["Dein EnergyShot ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 4:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						player setFatigue 0;
						[] spawn
						{
							DWEV_redshot_effect = time;
							DWEV_redshot_aktiv = true;
							hint "Für 15 Minuten kannst du nun Dauerlaufen.";
							player enableFatigue false;
							waitUntil {!alive player OR ((time - DWEV_redshot_effect) > (15 * 60))};
							player enableFatigue true;
							DWEV_redshot_aktiv = false;
							titleText["Dein EnergyShot ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 5: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						player setFatigue 0;
						[] spawn
						{
							DWEV_redshot_effect = time;
							DWEV_redshot_aktiv = true;
							hint "Für 30 Minuten kannst du nun Dauerlaufen.";
							player enableFatigue false;
							waitUntil {!alive player OR ((time - DWEV_redshot_effect) > (30 * 60))};
							player enableFatigue true;
							DWEV_redshot_aktiv = false;
							titleText["Dein EnergyShot ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
		};
	};
	
	case (_item == "kraftriegel"):
	{
		if(DWEV_kraftriegel_aktiv) exitWith {hint "Du hast schon ein Kraftriegel gegessen."};
		_kraftstufe = round(random 5);
		
		switch (_kraftstufe) do
		{
			case 0: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						DWEV_maxWeight = DWEV_maxWeight + 50;
						[] spawn
						{
							DWEV_kraftriegel_effect = time;
							DWEV_kraftriegel_aktiv = true;
							hint "Für 60 Minuten kannst du nun 50 mehr Gewicht tragen.";
							waitUntil {!alive player OR ((time - DWEV_kraftriegel_effect) > (60 * 60))};
							DWEV_maxWeight = DWEV_maxWeight - 50;
							DWEV_kraftriegel_aktiv = false;
							titleText["Dein Kraftriegel ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 1:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						DWEV_maxWeight = DWEV_maxWeight + 10;
						[] spawn
						{
							DWEV_kraftriegel_effect = time;
							DWEV_kraftriegel_aktiv = true;
							hint "Für 60 Minuten kannst du nun 10 mehr Gewicht tragen.";
							waitUntil {!alive player OR ((time - DWEV_kraftriegel_effect) > (60 * 60))};
							DWEV_maxWeight = DWEV_maxWeight - 10;
							DWEV_kraftriegel_aktiv = false;
							titleText["Dein Kraftriegel ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 2:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						DWEV_maxWeight = DWEV_maxWeight + 15;
						[] spawn
						{
							DWEV_kraftriegel_effect = time;
							DWEV_kraftriegel_aktiv = true;
							hint "Für 60 Minuten kannst du nun 15 mehr Gewicht tragen.";
							waitUntil {!alive player OR ((time - DWEV_kraftriegel_effect) > (60 * 60))};
							DWEV_maxWeight = DWEV_maxWeight - 15;
							DWEV_kraftriegel_aktiv = false;
							titleText["Dein Kraftriegel ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 3:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						DWEV_maxWeight = DWEV_maxWeight + 20;
						[] spawn
						{
							DWEV_kraftriegel_effect = time;
							DWEV_kraftriegel_aktiv = true;
							hint "Für 60 Minuten kannst du nun 20 mehr Gewicht tragen.";
							waitUntil {!alive player OR ((time - DWEV_kraftriegel_effect) > (60 * 60))};
							DWEV_maxWeight = DWEV_maxWeight - 20;
							DWEV_kraftriegel_aktiv = false;
							titleText["Dein Kraftriegel ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 4:
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						DWEV_maxWeight = DWEV_maxWeight + 30;
						[] spawn
						{
							DWEV_kraftriegel_effect = time;
							DWEV_kraftriegel_aktiv = true;
							hint "Für 60 Minuten kannst du nun 30 mehr Gewicht tragen.";
							waitUntil {!alive player OR ((time - DWEV_kraftriegel_effect) > (60 * 60))};
							DWEV_maxWeight = DWEV_maxWeight - 30;
							DWEV_kraftriegel_aktiv = false;
							titleText["Dein Kraftriegel ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
			case 5: // hat 50% weniger chance als 1 2 3 oder 4 zu kommen
			{
				if(([false,_item,1] call DWEV_fnc_handlelnv)) then
					{
						DWEV_maxWeight = DWEV_maxWeight + 40;
						[] spawn
						{
							DWEV_kraftriegel_effect = time;
							DWEV_kraftriegel_aktiv = true;
							hint "Für 60 Minuten kannst du nun 50 mehr Gewicht tragen.";
							waitUntil {!alive player OR ((time - DWEV_kraftriegel_effect) > (60 * 60))};
							DWEV_maxWeight = DWEV_maxWeight - 40;
							DWEV_kraftriegel_aktiv = false;
							titleText["Dein Kraftriegel ist abgelaufen!","PLAIN"];
							closeDialog 0;
						};
					};
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull DWEV_spikestrip) exitWith {hint "Du hast bereits Nagelbänder ausgelegt."};
		if(([false,_item,1] call DWEV_fnc_handlelnv)) then
		{
			[] spawn DWEV_fnc_spikeStrip;
			closeDialog 0;
		};
	};
	
	case (_item == "schnuller"):
	{
		if(([false,_item,1] call DWEV_fnc_handlelnv)) then
		{		
			[player,"baby_cry"] call DWEV_fnc_globalSound;
			closeDialog 0;
		};
	};
	
	case (_item == "verband"):
	{
		if(([false,_item,1] call DWEV_fnc_handlelnv)) then
		{		
			player setdamage 0;
			closeDialog 0;
		};
	};
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call DWEV_fnc_handlelnv)) then
		{
			player setVariable["missingOrgan",false,true];
			DWEV_thirst = 100;
			DWEV_hunger = 100;
			player setFatigue .5;
			[getPlayerUID player,0, side player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Du kannst nicht Tanken während du im Fahrzeug bist!"};
		[] spawn DWEV_fnc_jerryRefuel;
		closeDialog 0;
	};

	case (_item IN ["beer","vodka","moonshine","cocainp","marijuana","heroinp","cocainep","meth","dmt","zauberpilz","schlafmohnp","methge","dmtge","cocainege","heroinge","marijuanage","zauberpilzge","heroinsp","joint","schlafmohnstreck"]):
	{
		[_item] call DWEV_fnc_eatFood;
	};
	
	
	case (_item == "lockpick"):
	{
		[] spawn DWEV_fnc_lockpick;
		closeDialog 0;
	};
	
	case (_item == "alarmanlage"):
	{
			[] spawn DWEV_fnc_disableAlarm;
			closeDialog 0;
	};
	
	case (_item == "fahrsperre"):
	{
			[] spawn DWEV_fnc_disableSperre;
			closeDialog 0;
	};
	
	case (_item in ["water","coffee","apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","donuts","tbacon","peach","brot","pille","melon","melonp","banana","bananap","kokos","kokosp"]):
	{
		[_item] call DWEV_fnc_eatFood;
		
	};
	
	case (_item == "pickaxe"):
	{
		hint "Spitzhacke kann nur mit der Sammeltaste benutzt werden.(Standard: L Windows)";
	};

	case (_item == "shovel"):
	{
		hint "Schaufel kann nur mit der Sammeltaste benutzt werden.(Standard: L Windows)";
	};
	
	case (_item == "hammer"):
	{
		[] spawn DWEV_fnc_hammer;
		closeDialog 0;
	};

	case (_item == "kopflampe"):
	{
		[] spawn DWEV_fnc_useFlashlight;
		closeDialog 0;
	};
	
	default
	{
		hint "Dieser Gegenstand kann nicht genutzt werden.";
	};
};
	
[] call DWEV_fnc_p_updateMenu;
