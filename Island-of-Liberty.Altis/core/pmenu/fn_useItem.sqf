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
			[player,"drink"] call life_fnc_arsenalsounds;
			life_thirst = 100;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
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
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (EQUAL(_item,"tracker")): {
        [] spawn life_fnc_tracker;
    };
	
	case (EQUAL(_item,"pickaxe")): {
		[] spawn life_fnc_pickaxeUse;	
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
    };
	
	case (EQUAL(_item,"cocaine_processed")): 
	{ 
		if(playerSide in [west,independent]) exitWith {hint "Hallo Sie sind im Dienst!!";}; 
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then 
			{ 
				if(isNil "life_drug") then {life_drug = 0;}; 
				//Wenn er Drogen nimmt
				life_drug = life_drug + 0.08; 
				if (life_drug < 0.00) exitWith {}; 
				[] spawn life_fnc_Cocainenimm; 
			}; 
	};
	
	case (EQUAL(_item,"heroin_processed")): 
	{ 
		if(playerSide in [west,independent]) exitWith {hint "Hallo Sie sind im Dienst, gehts noch!!";}; 
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then 
			{ 
				if(isNil "life_drug") then {life_drug = 0;}; 
				//Wenn er Drogen nimmt
				life_drug = life_drug + 0.08; 
				if (life_drug < 0.00) exitWith {}; 
				[] spawn life_fnc_Heroinnimm; 
			}; 
	};
	
	case (_item == "mash"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_pilze;
		};
    };
	case (_item == "lsd"): {

		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo1";};

		if (([false,_item, 1] call life_fnc_handleInv)) then {

			[] spawn life_fnc_useLSD;
		};
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach","trauben","bananen"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 150;};
					default {life_hunger = _sum;};
				};
			};
		};
	};
	
	case (EQUAL(_item,"feuerwerkrandom")): {
		if(!isNull life_feuerwerk) exitWith {hint localize "STR_ISTR_feuerwerk"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
		[] spawn life_fnc_feuerwerkrandom;
		};
	};

	case (EQUAL(_item,"feuerwerkred")): {
		if(!isNull life_feuerwerk) exitWith {hint localize "STR_ISTR_feuerwerk"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_feuerwerkred;
		};
	};

	case (EQUAL(_item,"feuerwerkblue")): {
		if(!isNull life_feuerwerk) exitWith {hint localize "STR_ISTR_feuerwerk"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_feuerwerkblue;
		};
	};

	case (EQUAL(_item,"feuerwerkgreen")): {
		if(!isNull life_feuerwerk) exitWith {hint localize "STR_ISTR_feuerwerk"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_feuerwerkgreen;
		};
	};
	
	case (EQUAL(_item,"feuerwerkwhite")): {
		if(!isNull life_feuerwerk) exitWith {hint localize "STR_ISTR_feuerwerk"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_feuerwerkwhite;
		};
	};

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
