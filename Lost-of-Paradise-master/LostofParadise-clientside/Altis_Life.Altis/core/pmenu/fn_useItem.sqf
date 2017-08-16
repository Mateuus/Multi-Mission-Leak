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
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	case (_item == "bier"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn life_fnc_bier;
		};
	};
	
		case (_item == "pilsp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn life_fnc_lopbier;
		};
	};
	
	case (_item == "methp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_meth;
		};
	};
	
	case (_item == "brenn"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            [] spawn life_fnc_usebrenn;
        };
    };
	
	case (_item == "badcocaine"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_meth;
		};
	};
	
	case (_item == "krokodile"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_meth;
		};
	};
	
	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_kokain;
		};
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
	};
	
	case (_item == "pille"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_pille;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player playMove "AfalPknlMstpSnonWnonDnon";
			sleep 1;
			player setDamage 0;
			life_hunger = 100;
			life_thirst = 100;
		};
	};
	
	case (_item == "frogp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_lsd;
		};
	};
	
	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_heroin;
		};
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
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
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "mauer"):
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst schon eine Pylone!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_mauer;
		};
}	;

	case (_item == "geld"):
	{
		if(!isNull life_geld) exitWith {hint "Du legst schon Falschgeld!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_geld;
		};
	};

	case (_item == "lampe"):
	{
		if(!isNull life_lampe) exitWith {hint "Du stellst schon einen Strahler auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_lampe;
		};
	};
	
	case (_item == "dixi"):
	{
		if(!isNull life_dixi) exitWith {hint "Du stellst schon eine Toilette auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_dixi;
		};
	};
	
	case (_item == "generator"):
	{
		if(!isNull life_generator) exitWith {hint "Du stellst schon einen Generator auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_generator;
		};
	};
	
	case (_item == "matratze"):
	{
		if(!isNull life_matratze) exitWith {hint "Du stellst schon eine Matratze auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_matratze;
		};
	};
	
	case (_item == "zelt"):
	{
		if(!isNull life_zelt) exitWith {hint "Du stellst schon ein Pavillon auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_zelt;
		};
	};
	
	case (_item == "tisch"):
	{
		if(!isNull life_tisch) exitWith {hint "Du stellst schon einen Tisch auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_tisch;
		};
	};
	
	case (_item == "wand"):
	{
		if(!isNull life_wand) exitWith {hint "Du stellst schon eine Mauer auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_wand;
		};
	};
	
	case (_item == "schranke"):
	{
		if(!isNull life_schranke) exitWith {hint "Du stellst schon eine Schranke auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_schranke;
		};
	};
	
	case (_item == "sperre"):
	{
		if(!isNull life_sperre) exitWith {hint "Du stellst schon eine Barriere auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_sperre;
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
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","doner","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};
	
	case (_item == "underwatercharge"): {
		player reveal gold_safe;
		(group player) reveal gold_safe;
		[cursorTarget] spawn life_fnc_underwaterCharge;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;