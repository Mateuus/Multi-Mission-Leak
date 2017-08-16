#include "..\script_macros.hpp"
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];


switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			ES_thirst = 100;
			if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					ES_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - ES_redgull_effect) > (3 * 60))};
					player enableFatigue true;
				};
			};
		};
	};
	
	case (EQUAL(_item,"boltcutter")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[cursorTarget] spawn ES_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (EQUAL(_item,"blastingcharge")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn ES_fnc_blastingCharge;
	};
	
	case (EQUAL(_item,"defusekit")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[cursorTarget] spawn ES_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call ES_fnc_storageBox;
	};
	
	case (EQUAL(_item,"spikeStrip")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_spikeStrip;
		};
	};
	
	case (EQUAL(_item,"licht")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_licht) exitWith {hint localize "STR_ISTR_licht"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_licht;
		};
	};
	
	case (EQUAL(_item,"barriere")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_barriere) exitWith {hint localize "STR_ISTR_barriere"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_barriere;
		};
	};
	
	case (EQUAL(_item,"tape")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_tape) exitWith {hint localize "STR_ISTR_tape"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_tape;
		};
	};
	
	case (EQUAL(_item,"card")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			hintSilent "Du hast die KeyKarte Aktiviert. Du kanst jetzt die Bank Schranken öffnen!";
			ES_BankCode = true;
		};
	};

	case (EQUAL(_item,"schranke")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_schranke) exitWith {hint localize "STR_ISTR_schranke"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_schranke;
		};
	};
	
	case (EQUAL(_item,"pylone")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_pylone) exitWith {hint localize "STR_ISTR_pylone"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_pylone;
		};
	};
	
	case (_item == "rabbit"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "peach"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_thirst = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "apple"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "tbacon"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "goat"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "sheep"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "rooster"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "hen"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "catshark"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "mullet"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "tuna"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "mackerel"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "ornate"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "salema"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "schoko"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "apfels"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "olivenp"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "peachs"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "kokosu"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "kakaop"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "bananen"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};

	case (_item == "muschelfleis"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "donuts"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"eat"] call ES_fnc_globalSound;
		ES_hunger = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"drink"] call ES_fnc_globalSound;	
		ES_thirst = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "coffee"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"drink"] call ES_fnc_globalSound;	
		ES_thirst = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "waterBottle"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then {
		[player,"drink"] call ES_fnc_globalSound;	
		ES_thirst = 100;
		player setFatigue 0;
		};
	};
	
	case (_item == "lappi"):
	{
		_wlanZone = "";
		_wlanZones = ["wlan_1","wlan_2","wlan_3"];
		{
			if(player distance (getMarkerPos _x) < 30) exitWith {_WlanZone = _x;};
		} foreach _wlanZones;

		if(_wlanZone == "") exitWith {hint "Du kannst hier keinen Laptop aufbauen, da du hier kein Wlan hast!";};
		_table = nearestObject[player, "OfficeTable_01_new_F"];
		_tablePos = getPos _table;
		if(player distance _tablePos > 5) exitWith {hint "Du musst den Laptop an einem Tisch aufbauen!";};
		 
		 
		if(!isNull ES_theLappi) exitWith {hint "Du kannst nur einen Laptop aufbauen!";};
		if(([false,_item,1] call ES_fnc_handleInv)) then
		{
			[] spawn ES_fnc_lappi;
		};
	};
	
	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn ES_fnc_jerryRefuel;
	};
	
	case (EQUAL(_item,"lockpick")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[] spawn ES_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtlesoup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call ES_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = ES_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {ES_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {ES_hunger = 100;};
					default {ES_hunger = _sum;};
				};
			};
		};
	};

	case (EQUAL(_item,"pickaxe")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[] spawn ES_fnc_pickAxeUse;
	};
	
	case (_item =="bottledwhiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call ES_fnc_handleInv)) then
		{
			if(isNil "ES_drink") then {ES_drink = 0;};
			ES_drink = ES_drink + 0.06;
			if (ES_drink < 0.07) exitWith {};
			[] spawn ES_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call ES_fnc_handleInv)) then
		{
			if(isNil "ES_drink") then {ES_drink = 0;};
			ES_drink = ES_drink + 0.08;
			if (ES_drink < 0.09) exitWith {};
			[] spawn ES_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call ES_fnc_handleInv)) then
		{
			if(isNil "ES_drink") then {ES_drink = 0;};
			ES_drink = ES_drink + 0.02;
			if (ES_drink < 0.06) exitWith {};
			[] spawn ES_fnc_drinkbeer;
		};
	};
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call ES_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			ES_thirst = 100;
			ES_hunger = 100;
			player setFatigue .5;
		};
	};
	
	case (EQUAL(_item,"akkuschrauber")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[] spawn ES_fnc_akkuschrauber;
	};
	
	case (EQUAL(_item,"schildp")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_einsatzschild;
		};
	};
	
	case (EQUAL(_item,"head")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_head) exitWith {hint localize "STR_ISTR_head"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_head;
		};
	};
	
	case (EQUAL(_item,"hund1")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hund1) exitWith {hint localize "STR_ISTR_hund1"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hund1"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"hund2")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hund2) exitWith {hint localize "STR_ISTR_hund2"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hund2"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"hund3")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hund3) exitWith {hint localize "STR_ISTR_hund3"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hund3"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"hund4")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hund4) exitWith {hint localize "STR_ISTR_hund4"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hund4"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"hund5")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hund5) exitWith {hint localize "STR_ISTR_hund5"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hund5"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"hund6")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hund6) exitWith {hint localize "STR_ISTR_hund6"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hund6"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"hase")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};	
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_hase) exitWith {hint localize "STR_ISTR_hase"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["hase"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"ziege")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_ziege) exitWith {hint localize "STR_ISTR_ziege"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["ziege"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"huhn")): {
		
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_huhn) exitWith {hint localize "STR_ISTR_huhn"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["huhn"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"sheep")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		If(!HundWufWuf) exitWith { hint "Du hast schon ein Tier"; };
		If(HundHide) exitWith { hint "Du hast schon ein Tier";	};

		if(!isNull ES_sheep) exitWith {hint localize "STR_ISTR_sheep"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["sheep"] spawn ES_fnc_tiere;
		};
	};
	
	case (EQUAL(_item,"grafitti")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafitti"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafitti"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafitti2")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafitti2"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafitti2"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafitti3")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafitti3"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafitti3"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafitti4")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafitti4"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafitti4"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafitti5")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafitti5"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafitti5"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittid")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittid"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidmit")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidmit"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidope")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidope"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidfup")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidfup"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidgo")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidgo"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidbast")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidbast"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidfuckp")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidfuckp"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"grafittidfuckp2")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["grafittidfuckp2"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"ms13g")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_grafitti) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "nografitti") < 50) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["ms13g"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"rasenm")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_rasenm) exitWith {hint localize "STR_ISTR_rasenm"};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["rasenm"] spawn ES_fnc_rasenm;
		};
	};
	
	case (EQUAL(_item,"saw")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_saw) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "saw") < 10) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["saw"] spawn ES_fnc_ESitems;
		};
	};
	
	case (EQUAL(_item,"esaw")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(!isNull ES_esaw) exitWith {hint localize "STR_ISTR_grafittid"};
		if(vehicle player distance (getMarkerPos "esaw") < 10) exitWith { hint "Dies ist in der Naehe vom Kavalla Marktplatz nicht moeglich";};
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["esaw"] spawn ES_fnc_ESitems;
		};
	};
	
	case (_item == "blaulicht"):
    {
        if(!isNull ES_blaulicht) exitWith {hint "Du hast bereits ein Magnetblaulicht platziert."};
        if(([false,_item,1] call ES_fnc_handleInv)) then
        {
            [] spawn ES_fnc_blaulicht;
        };
    };
	
	case (_item == "pilze_refined"):
	{
    if(([false,_item,1] call ES_fnc_handleInv)) then
    {
        [] spawn ES_fnc_pilze;
    };
    };
	
	case (_item == "heroin_processed"):
	{
    if(([false,_item,1] call ES_fnc_handleInv)) then
    {
        [] spawn ES_fnc_hero;
    };
    };
	
	case (_item == "cocaine_processed"):
	{
    if(([false,_item,1] call ES_fnc_handleInv)) then
    {
        [] spawn ES_fnc_koks;
    };
    };
	
	case (_item == "marijuana"):
	{
    if(([false,_item,1] call ES_fnc_handleInv)) then
    {
        [] spawn ES_fnc_weed;
    };
    };
	
	case (_item == "schild"):
	{
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
   		if(([false,_item,1] call ES_fnc_handleInv)) then {
			["schild"] spawn ES_fnc_ESitems;
		};
    };
	
	case (_item == "schildd"):
	{
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};	
    	if(([false,_item,1] call ES_fnc_handleInv)) then {
			["schildd"] spawn ES_fnc_ESitems;
		};
    };
	
	case (_item == "feuerl"):
	{
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
    	if(([false,_item,1] call ES_fnc_handleInv)) then {
        [] spawn ES_fnc_feuerloescher;
    };
    };
	
	case (_item == "flakes"):
	{
	if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
    if(([false,_item,1] call ES_fnc_handleInv)) then
    {
        [] spawn ES_fnc_flakes;
    };
    };
	
	case (EQUAL(_item,"blindfold")): {
	if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[cursorTarget] spawn ES_fnc_blindfold;
	};
	
	case (_item == "tobacco"):
{
    if(([false,_item,1] call ES_fnc_handleInv)) then
    {
        [] spawn ES_fnc_usetobacco;
    };
	};
	
	case (EQUAL(_item,"speedbomb")): {
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		if(vehicle player distance (getMarkerPos "Safe_Kav") < 300 ) exitWith { hint "Dies ist in der Naehe vom Kavalla nicht moeglich";};
		if(vehicle player distance (getMarkerPos "Safe_Reb") < 300 ) exitWith { hint "Dies ist in der Naehe vom Rebellen HQ nicht moeglich";};
		if(vehicle player distance (getMarkerPos "Safe_Reb_1") < 300 ) exitWith { hint "Dies ist in der Naehe vom Rebellen HQ nicht moeglich";};
		if(vehicle player distance (getMarkerPos "Safe_Schwarzmarkt") < 300 ) exitWith { hint "Dies ist in der Naehe vom Schwarzmarkt nicht moeglich";};
		if(vehicle player distance (getMarkerPos "Event_Admin") < 400 ) exitWith { hint "Dies ist in der Naehe vom Event nicht moeglich";};
		[cursorTarget] spawn ES_fnc_speedbomb;
		
	};
	
	case (EQUAL(_item,"turbol")): {
		[cursorTarget] spawn ES_fnc_turbol;
		
	};
	
	case (_item == "bagger"):
	{
		if (vehicle player != player) exitWith {hint "Du bist im Fahrzeug";};
		[] spawn ES_fnc_shiff;
	};
	
	case (EQUAL(_item,"gpstracker")): {
		[cursorTarget] spawn ES_fnc_gpstracker;
	};
	
	case (EQUAL(_item,"painkiller")):
	{
		if(vehicle player != player) exitWith {hint "Du kannst dich nicht in einem Fahrzeug heilen..."};
		if(([false,_item,1] call ES_fnc_handleInv)) then
		{
			player setDamage 0;
			player setFatigue 0;
			player allowDamage true;
			player enableSimulation true;
			closeDialog 0;
			hint "Die Schmerzmittel haben gewirkt! Du hast nun wieder volles Leben."; 
		};
	};
	
	case (_item == "ring"):	{		
		if( ES_married != "-2" ) then 		{	
		if(([false,_item,1] call ES_fnc_handleInv)) then			{			
		hint "Awesome! Jemand möchte dich Heiraten! Du erhälst 5000$ from vom Staat - Wir wünschen euch das Beste!";				
		ES_cash = ES_cash + 5000;				
		if(ES_married == "-1") then {				
		ES_married = "someone";				};			
		[[0,format["%1 gerade geheiratet %2! Das ist großartig , nicht wahr? Wir wünschen Ihnen viel Glück!",profileName, ES_married]],"ES_fnc_broadcast",nil,false] spawn ES_fnc_MP;			
		ES_married = "-2";			};		}		else		{			hint "Sie können nicht zweimal heiraten ! Was denken Sie , wer Sie sind ?";		
		};	
	};
	
	case (_item in ["Epinephrin"]): {
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			ES_thirst = 100;
			if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"Epinephrin") && {EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					ES_redgull_effect = time;
					titleText[localize "STR_ISTR_Epinephrin","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - ES_redgull_effect) > (10 * 60))};
					player enableFatigue true;
				};
			};
		};
	};
	
	case (EQUAL(_item,"muscheln")): {
		if(([false,_item,1] call ES_fnc_handleInv)) then {
			[] spawn ES_fnc_perle;
		};
	};
	
	default {
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call ES_fnc_p_updateMenu;
[] call ES_fnc_hudUpdate;