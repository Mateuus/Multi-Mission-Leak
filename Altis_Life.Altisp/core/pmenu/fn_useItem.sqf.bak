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
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - life_redgull_effect) > (20 * 60))};
					player enableFatigue true;
				};
			};
		};
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorObject] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorObject] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorObject] spawn life_fnc_defuseKit;
	};

	case (EQUAL(_item,"storagesmall")): {
		[] call life_fnc_storageBoxSmall;
	};

	case (EQUAL(_item,"storagebig")): {
		[] call life_fnc_storageBoxBig;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
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

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
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
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMarihuana;
		};
	};
	
	case (_item == "heroin_processed"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};
	
	case (_item == "cocaine_processed"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};

    case (EQUAL(_item,"bottledwhiskey")): {		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player GVAR ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then	{			
			if(isNil "life_drink") then {life_drink = 0;};			
			life_drink = life_drink + 0.06;			
			if (life_drink < 0.07) exitWith {};			
			[] spawn life_fnc_drinkwhiskey;		
		};	
	};	
	
	case (EQUAL(_item,"bottledshine")):	{		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player GVAR ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then	{			
			if(isNil "life_drink") then {life_drink = 0;};			
			life_drink = life_drink + 0.08;			
			if (life_drink < 0.09) exitWith {};			
			[] spawn life_fnc_drinkmoonshine;		
		};	
	};	
	
	case (EQUAL(_item,"bottledbeer")):	{				
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};	
		if((player GVAR ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};		
		if(([false,_item,1] call life_fnc_handleInv)) then	{			
			if(isNil "life_drink") then {life_drink = 0;};			
			life_drink = life_drink + 0.02;			
			if (life_drink < 0.06) exitWith {};			
			[] spawn life_fnc_drinkbeer;		
		};	
	};
	case (EQUAL(_item,"kidney")):
 {
 if(([false,_item,1] call life_fnc_handleInv)) then
 {
 player SVAR["missingOrgan",false,true];
 life_thirst = 100;
 life_hunger = 100;
 player setFatigue .5;
 };
 };

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;

case (_item isEqualTo "morphine"):
	{
		[] spawn life_fnc_morphine;
	};

	case (_item isEqualTo "lizak"):
	{
		[] spawn life_fnc_lizak;
	};
