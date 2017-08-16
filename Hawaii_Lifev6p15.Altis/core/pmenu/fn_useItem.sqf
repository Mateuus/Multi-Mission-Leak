#include "..\..\script_macros.hpp"
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull")) then {
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {
					[] spawn {
						life_redgull_effect = time;
						titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
						player enableFatigue false;
						waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
						player enableFatigue true;
					};
				};
			};
		};
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (EQUAL(_item,"storagesmall")): {
		[] call life_fnc_storageBoxSmall;
	};

	case (EQUAL(_item,"storagebig")): {
		[] call life_fnc_storageBoxBig;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_SpikesVehicle"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtlesoup","hen","rooster","sheep","goat","donuts","tbacon","peach","banane","ananas"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	case (EQUAL(_item,"pickaxe")): {
		[] spawn life_fnc_pickAxeUse;
	};

	case (EQUAL(_item,"protestSign")): {
		[] spawn life_fnc_protestSign;
        closeDialog 0;
	};

	case (EQUAL(_item,"gpstracker")): {
		[cursorTarget] spawn life_fnc_gpsTracker;
	};

	case (EQUAL(_item,"painkillers")): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setDamage 0;
			player setFatigue 0;
			player allowDamage true;
			[] call life_fnc_update_safezone;
			player enableSimulation true;
			closeDialog 0;
			hint "Die Schmerzmittel haben gewirkt! Du hast nun wieder volles Leben."
		};
	};

	case (EQUAL(_item,"zyankalikapsel")): {
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			hint "Du Feigling!!";
			[0,format["%1 der Feigling wird nun elendlich an Zyankali verenden!",player GVAR["realname",name player]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
			sleep 3;
			player setdamage 1;
		};
	};

	case (EQUAL(_item,"morphium")): {
		if(playerSide in [west,independent]) exitWith {hint "Du bist im Dienst!"};
		if(vehicle player != player) exitWith {hint "Du kannst dich nicht in einem Fahrzeug heilen..."};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			player setFatigue 1;
			player setDamage 0;
			life_drink = life_drink + 0.1;
			life_thirst = life_thirst - 65;
			life_hunger = life_hunger - 75;
			closeDialog 0;
			[] spawn life_fnc_useHeroin;
		};
	};

	case (EQUAL(_item,"blindfold")): {
		if(playerSide in [west,independent]) exitWith {hint "Du bist im Dienst!"};
		if(vehicle player != player) exitWith {hint "Du kannst das nicht im Fahrzeug verwenden!"};
		_unit = cursorTarget;
		if(isNull _unit) exitWith {}; 
		if((player distance _unit > 3)) exitWith {hint "Du bist zu weit weg!";};
		if(!(_unit getVariable "restrained")) exitWith {hint "Die Person muss gefesselt sein!";};
		if((_unit getVariable "masked")) exitWith {hint "Die Person ist bereits gefesselt!";};
		if(player == _unit) exitWith {};
		if(!isPlayer _unit) exitWith {};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_maskAction;
		};
	};

	case (EQUAL(_item,"beer")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};

	case (EQUAL(_item,"bottledwhiskey")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};

	case (EQUAL(_item,"bottledshine")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};

	case (EQUAL(_item,"meth")): {
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};

	case (EQUAL(_item,"heroinProcessed")): {
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};

	case (EQUAL(_item,"cocaineProcessed")): {
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};

	case (EQUAL(_item,"marijuana")): {
		if(playerSide in [west,independent]) exitWith {hint "Keine Drogen im Dienst !"};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
