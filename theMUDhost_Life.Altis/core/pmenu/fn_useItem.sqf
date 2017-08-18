#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item in ["ammoBox","ammoBoxS"]):
	{
		[_item] spawn life_fnc_ammoBox;
		closeDialog 0;
		if(_item == "ammoBox") then {life_inv_ammoBox = life_inv_ammoBox - 1;};
		if(_item == "ammoBoxS") then {life_inv_ammoBoxS = life_inv_ammoBoxS - 1;};
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case(_item in ["roadCone","roadBarrier","cncBarrier","cncBarrierL","barGate","mobileOutpost","floodLightSingle","floodLightDouble","outpostHMG","blueBarrier"]):
	{
		if(!(playerSide == west)) exitWith { hint "You have no idea how to use this item, perhaps if you were a police officer...";};
		if(__GETC__(life_coplevel) < 2) exitWith { hint "You aren't a trusted officer to use placeable items.";};
		[_item] spawn life_fnc_placeObject;
	};
	
	case (_item == "nitro"):
	{
		[] spawn life_fnc_nitro;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "vehammo"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(vehicle player == player) exitWith { hint "You must be in an armed vehicle to use this properly";};
			[] spawn life_fnc_vehammo;
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(__GETC__(life_coplevel) < 2 ) exitWith {hint "You are not allowed to use spike strips!"};
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","chicken_meat","sheep_meat","goat_meat","rabbit_meat","orange","strawberry","blueberry"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickaxeUse;
	};
	
	case (_item == "chainsaw"):
	{
		[] spawn life_fnc_chainsawUse;
	};

	case (_item =="bottledwhiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};
	
	case (_item == "underwatercharge"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			closeDialog 0;
			[_item] spawn life_fnc_underwaterCharge;
		};
	};
	
	case (_item == "speedbomb"):
	{
		[] spawn life_fnc_speedBomb;
	};
	
	case (_item == "tentciv"):
	{
		[_item, "Land_TentDome_F"] spawn life_fnc_tent;
	};

	case (_item == "joint"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_jointSmoke;
		};
	};
	
	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_drugAffects;
		};
	};
	
	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_drugAffects;
		};
	};
	
	case (_item == "dogwhistle"):
	{
		if(player getVariable["hasDog",false]) exitWith {hint "You already have a dog!"};
		
		[player] spawn life_fnc_dogInit;
	};
	
	case (_item == "gpstracker"):
	{
		if(vehicle player != player) exitWith { hint "You must be outside of the vehicle to perform this action."; };
		[cursorTarget] spawn life_fnc_gpsTracker;
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;