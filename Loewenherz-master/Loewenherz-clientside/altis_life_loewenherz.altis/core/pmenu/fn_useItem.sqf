#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item isEqualTo "water" or _item isEqualTo "coffee"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			lhm_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item isEqualTo "marijuana"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[] spawn lhm_fnc_weed;
			[[player,[[0, 1, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "lzigarette"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 0, 0, 0], [1, 0, 1, 1], [1, 1, 1, 1]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "stoivesant"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "krauser"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "rooth"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "hacken"):
	{

		[] spawn lhm_fnc_towTruck;

	};

	case (_item isEqualTo "malle"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "tracker"):
	{
		//usable checks
		if(isNull cursorObject) exitWith {};
		if(!(vehicle player isEqualTo player)) exitWith {hint "Das geht nicht im Auto Einstein!"};
		if(!(cursorObject isKindOf "AllVehicles") or (cursorObject isKindOf "Man")) exitWith {hint format["Das GPS kann an %1 nicht benutzt werden %2", typeof(cursorObject), name player]};
		if(player distance cursorObject > 4) exitWith {hint format["Du bist nicht nah genug am %1  %2. Du musst %3 Meter näher dran!", getText(configFile >> "CfgVehicles" >> typeof cursorObject >> "displayName"), name player, (player distance cursorObject) min 4]};
		//Usable? if not exits
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_tracker;
			closeDialog 0;
		};
	};

	case (_item isEqualTo "sensor"):
	{
		//usable checks
		if(!(vehicle player isEqualTo player)) exitWith {hint "Das geht nicht im Auto Einstein!"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_sensor;
			closeDialog 0;
		};
	};

	case (_item isEqualTo "graffiti"):
	{
		//usable checks
		if(!(vehicle player isEqualTo player)) exitWith {hint "Das geht nicht im Auto Einstein!"};
		if((getposATL player select 2) >= 0.1) exitWith {hint "Das geht hier nicht in dieser Höhe!"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_graffiti;
		};
	};

	case (_item isEqualTo "geocatch"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_geocatch;
			closeDialog 0;
		};
	};

	case (_item isEqualTo "egg"):
	{
		if(vehicle player != player) exitWith {hint "Das geht nicht im Fahrzeug"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			closeDialog 0;
			[] call lhm_fnc_spawnMenu;
		};

	};

	case (_item isEqualTo "sensor1"):
	{
		//usable checks
		if(!(vehicle player isEqualTo player)) exitWith {hint "Das geht nicht im Auto Einstein!"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_sensor;
		};
	};

	case (_item isEqualTo "axe"):
	{

		[] spawn lhm_fnc_gatherWood;

	};

	case (_item isEqualTo "tracker2"):
	{
		//Usable checks
		if(isNull cursorObject) exitWith {};
		if(!(vehicle player isEqualTo player)) exitWith {hint "Das geht nicht im Auto Einstein!"};
		if(!(cursorObject isKindOf "AllVehicles") or (cursorObject isKindOf "Man")) exitWith {hint format["Das GPS kann an %1 nicht benutzt werden %2", typeof(cursorObject), name player]};
		if(player distance cursorObject > 4) exitWith {hint format["Du bist nicht nah genug am %1  %2. Du musst %3 Meter näher dran!", getText(configFile >> "CfgVehicles" >> typeof cursorObject >> "displayName"), name player, (player distance cursorObject) min 4]};
		//Usable? if not exits
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_tracker;
			closeDialog 0;
		};
	};

	case (_item isEqualTo "heroinp"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 1, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
			[] spawn lhm_fnc_weed;
		};
	};

	case (_item isEqualTo "cocainep"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;   //zigarette
			[] spawn lhm_fnc_weed;
		};
	};

	case (_item isEqualTo "zigarette"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			_profName = "Smoke_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			[[player,[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],_time], "lhm_fnc_smoke", true, true] call lhm_fnc_mp;
		};
	};

	case (_item isEqualTo "boltcutter"): {
		[cursorObject] spawn lhm_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item isEqualTo "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		closeDialog 0;
		[cursorObject] spawn lhm_fnc_blastingCharge;
	};

	case (_item isEqualTo "defusekit"): {
		[cursorObject] spawn lhm_fnc_defuseKit;
		closeDialog 0;
	};

    case (_item isEqualTo "storagesmall"): {
        [false] call lhm_fnc_storageBox;

    };

    case (_item isEqualTo "storagebig"): {
        [true] call lhm_fnc_storageBox;
    };

	case (_item isEqualTo "redgull"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{

			_profName = "RedGull_Prof";
			_addExpAmount = 40;
			_time = ([_profname] call lhm_fnc_profData) select 0;
			[_profName,_addExpAmount] call lhm_fnc_addExp;
			lhm_thirst = 100;
			player setFatigue 0;
			[_time] spawn
			{
				_time1 = _this select 0;
				lhm_redgull_effect = time;
				titleText[format["Du kannst nun für %1 Sekunden länger laufen",round(_time1)],"PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - lhm_redgull_effect) > _time1)};
				player enableFatigue true;
			};
		};
	};

	case (_item isEqualTo "spikeStrip"):
	{
		if(!isNull lhm_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_spikeStrip;
			closeDialog 0;
		};
	};

	// Containerskript
	case (_item isEqualTo "container"):
	{
		if(!isNull lhm_container) exitWith {hint "Du stellst schon einen Container!"};
		if(([false,_item,1] call lhm_fnc_handleInv) && (__GETC__(lhm_medicLevel) > 2)) then
		{
			[] spawn lhm_fnc_container;
			closeDialog 0;
		}
		else
		{
			hint "Du bist kein Facharzt!";
		};
	};

	case (_item isEqualTo "roadbarrier1"):
	{
		//Medic Rang 1 darf diese nicht nutzen
		if((call lhm_medicLevel) == 1) exitWith {hint "Dein Rang reicht nicht aus"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_roadbarrier;
			closeDialog 0;
		};
	};

	case (_item isEqualTo "roadcone1"):
	{
		//Medic Rang 1 darf diese nicht nutzen
		if((call lhm_medicLevel) == 1) exitWith {hint "Dein Rang reicht nicht aus"};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_roadcone;
			closeDialog 0;
		};
	};

	case (_item isEqualTo "card"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_card;
		};
	};

	case (_item isEqualTo "protest"):
	{
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			[] spawn lhm_fnc_protest;
		};
	};
	//
	case (_item isEqualTo "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn lhm_fnc_jerryRefuel;
		closeDialog 0;
	};

	case (_item isEqualTo "lockpick"):
	{
		[] spawn lhm_fnc_lockpick;
		closeDialog 0;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call lhm_fnc_eatFood;
	};

	case (_item isEqualTo "pickaxe"):
	{
		[] spawn lhm_fnc_pickAxeUse;
	};

//LHM START
	case (_item isEqualTo "LHM_NanoBots"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 2)) then {
			if(([false,_item,1] call lhm_fnc_handleInv)) then
			{
				[player,LHM_NanoBotsDuration] spawn lhm_fnc_cop_nanobots;
			};
		} else {
			titleText[format["NUR Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["NUR Donator können dieses Item benutzen!"];
		};
	};
	case (_item isEqualTo "LHM_Adrenalin"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 1)) then {
			if(([false,_item,1] call lhm_fnc_handleInv)) then
			{
				[player,LHM_AdrenalinDuration] spawn lhm_fnc_cop_adrenalin;
			};
		} else {
			titleText[format["NUR Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["NUR Donator können dieses Item benutzen!"];
		};
	};
	case (_item isEqualTo "LHM_SoylentGreen"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
			if(([false,_item,1] call lhm_fnc_handleInv)) then
			{
				[player,LHM_SoylentGreenBuffDuration] spawn lhm_fnc_cop_SoylentGreenBuff;
			};
		} else {
			titleText[format["NUR Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["NUR Donator können dieses Item benutzen!"];
		};
	};
	case (_item isEqualTo "LHM_Satellite"):
	{
		//if ((((player getVariable ["LHM_Donatorlevel","0"])) > 2)) then {
			if(([false,_item,1] call lhm_fnc_handleInv)) then
			{
				[player] spawn lhm_fnc_cop_Satellite;
			};
		//} else {
		//	titleText[format["ONLY Donators can use this Item!"],"PLAIN"];
		//	hintsilent format["ONLY Donators can use this Item!"];
		//};
	};
	case (_item isEqualTo "LHM_TazerMine"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
			_ok = [player,"APERSMine_Range_Mag"] call BIS_fnc_invAdd;
			if (_ok) then {
				[false,_item,1] call lhm_fnc_handleInv;
				titleText[format["Eine Tazer Mine wurde deinem Inventar hinzugefügt!"],"PLAIN"];
				hintsilent format["Eine Tazer Mine wurde deinem Inventar hinzugefügt!"];
			} else {
				titleText[format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"],"PLAIN"];
				hintsilent format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"];
			};
		} else {
			titleText[format["Nur Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["Nur Donator können dieses Item benutzen!"];
		};
	};
	case (_item isEqualTo "LHM_TazerBoundingMine"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
			_ok = [player,"APERSBoundingMine_Range_Mag"] call BIS_fnc_invAdd;
			if (_ok) then {
				[false,_item,1] call lhm_fnc_handleInv;
				titleText[format["Eine Tazer Springmine wurde deinem Inventar hinzugefügt!"],"PLAIN"];
				hintsilent format["Eine Tazer Springmine wurde deinem Inventar hinzugefügt!"];
			} else {
				titleText[format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"],"PLAIN"];
				hintsilent format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"];
			};
		} else {
			titleText[format["NUR Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["NUR Donator können dieses Item benutzen!"];
		};
	};
	case (_item isEqualTo "LHM_TripwireTazerMine"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
			_ok = [player,"APERSTripMine_Wire_Mag"] call BIS_fnc_invAdd;
			if (_ok) then {
				[false,_item,1] call lhm_fnc_handleInv;
				titleText[format["Eine Tripwire Tazer Mine wurde deinem Inventar hinzugefügt!"],"PLAIN"];
				hintsilent format["Eine Tripwire Tazer Mine wurde deinem Inventar hinzugefügt!"];
			} else {
				titleText[format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"],"PLAIN"];
				hintsilent format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"];
			};
		} else {
			titleText[format["NUR Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["NUR Donator können dieses Item benutzen!"];
		};
	};
	case (_item isEqualTo "LHM_TazerGranade"):
	{
		if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
			_ok = [player,"MiniGrenade"] call BIS_fnc_invAdd;
			if (_ok) then {
				[false,_item,1] call lhm_fnc_handleInv;
				titleText[format["Eine Tazer Granate wurde deinem Inventar hinzugefügt!"],"PLAIN"];
				hintsilent format["Eine Tazer Granate wurde deinem Inventar hinzugefügt!"];
			} else {
				titleText[format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"],"PLAIN"];
				hintsilent format["Das konnte deinem Inventar nich hinzugefügt werden, kein Platz!"];
			};
		} else {
			titleText[format["NUR Donator können dieses Item benutzen!"],"PLAIN"];
			hintsilent format["NUR Donator können dieses Item benutzen!"];
		};
	};

	case (_item isEqualTo "LHM_Speedtrap"):
	{
        [] spawn lhm_fnc_speedtrapAdd;
        closeDialog 0;
	};
// LHM Alcohol
	case (_item isEqualTo"bottledwhiskey"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			if(isNil "lhm_drink") then {lhm_drink = 0;};
			lhm_drink = lhm_drink + 0.06;
			if (lhm_drink < 0.07) exitWith {};
			[] spawn lhm_fnc_drinkwhiskey;
		};
	};

	case (_item isEqualTo"bottledshine"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			if(isNil "lhm_drink") then {lhm_drink = 0;};
			lhm_drink = lhm_drink + 0.08;
			if (lhm_drink < 0.09) exitWith {};
			[] spawn lhm_fnc_drinkmoonshine;
		};
	};

	case (_item isEqualTo"bottledbeer"):
	{

		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call lhm_fnc_handleInv)) then
		{
			if(isNil "lhm_drink") then {lhm_drink = 0;};
			lhm_drink = lhm_drink + 0.02;
			if (lhm_drink < 0.06) exitWith {};
			[] spawn lhm_fnc_drinkbeer;
		};
	};
// LHM Alcohol END
// LHM END

	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call lhm_fnc_p_updateMenu;
[] call lhm_fnc_hudUpdate;