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
			player say3D "drink";
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player || ((time - life_redgull_effect) > (5 * 60))};
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

	case (EQUAL(_item,"radarfalle")): {
		[] spawn life_fnc_speedtrapAdd;
		closeDialog 0;
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

	case (EQUAL(_item,"nitro")): {
		[] spawn life_fnc_nitro;closeDialog 0;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;

			_playerID = getPlayerUID player;
			_playerName = name player;
			_type = 6;
			[_playerID,_playerName,"","",_type,""] remoteExecCall ["TON_fnc_copLog", (call life_fnc_HCC)];
		};
	};

	case (EQUAL(_item,"cone")): {
		if(!isNull life_cone) exitWith {hint "Vous avez déjà un cone en déploiement!"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_cone;
		};
	};

	case (EQUAL(_item,"barriere")): {
		if(!isNull life_barriere) exitWith {hint "Vous avez déjà une barrière en déploiement!"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_barriere;
		};
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};

	case (_item == "traceurgps"): {
	 [cursorTarget] spawn life_fnc_gpsTracker;
	 closeDialog 0;
 	};

 	case (_item == "gpsfinder"): {
		[cursorTarget] spawn life_fnc_gpsTrackerRemove;
		closeDialog 0;
 	};

	case (EQUAL(_item,"couteau")): {
		hint "Le couteau sert à prélever des organes !";
	};

	case (_item == "kidney"): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(!(player getVariable ["missingOrgan",FALSE])) exitWith {hint "Ce rein ne me sert à rien !"};
			player SVAR["missingOrgan",false,true];
			player setdamage 0;
			life_thirst = 100;
			life_hunger = 100;
			hint "Vous avez récupéré votre rein !";
		};
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtlesoup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
					player say3D "eat";
				};
			};
		};
	};


	case (EQUAL(_item,"pickaxe")): {
		hint "Utilise SHIFT + C pour miner !";
	};

	case (EQUAL(_item,"prouge")): {
		[] spawn life_fnc_prougeUse;
	};
	case (EQUAL(_item,"pvert")): {
		[] spawn life_fnc_pvertUse;
	};
	case (EQUAL(_item,"pbleu")): {
		[] spawn life_fnc_pbleuUse;
	};
	case (_item == "marijuana"): {
    if(([false,_item,1] call life_fnc_handleInv)) then {
        [] spawn life_fnc_weed;
    };
	};

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
