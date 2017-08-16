#include <macro.h>
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Vous devez d'abord choisir un objet !";};
_item = lbData[2005,(lbCurSel 2005)];
switch (true) do
{

	case(_item in ["water","coffee","sprite","pepsi","cafe","smoothies"]):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			if(_item in ["coffee","cafe"] && (life_drink > 0.00 || life_drug > 0.00)) then {
				if(life_drink <= 0.02) then {life_drink = 0.00;} else {life_drink = life_drink - 0.02;};				
				if(life_drug <= 0.02) then {life_drug = 0.00;} else {life_drug = life_drug - 0.02;};				
			};
		};
	};	
	case (_item == "feucamp"):
	{
		if (player distance (getMarkerPos "city") < 1000 || player distance (getMarkerPos "civ_spawn_1") < 1000) exitWith { hint "Faire un feu de camp si pres d'une ville est interdit !"; };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["Vous avez crée un feu de camp.","PLAIN"];
			_fire = "Campfire_burning_F" createVehicle (getPos player);
			[[_fire],"life_fnc_simDisable",false,false] spawn BIS_fnc_MP;
			_fire setVariable ["owner", player, true];
		};
	};	
	case (_item == "sacpatate"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_sac;
		};
	};	
	case(_item in ["defib"]):
	{
		titleText["Cet objet est utilisable sur une personne mourrante.","PLAIN"];
	};	
	case (_item == "bloodbag"): {
		[cursorTarget] spawn life_fnc_bloodbag;
		closeDialog 0;
	};
	case (_item == "painkillers"): {
		[nil,nil,nil,player] call life_fnc_painkillers;
		closeDialog 0;
	};		
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(grpPlayer) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	case(_item in ["mur","sac","cone","barre","lightr","lightg","lighty","flecheg","fleched","projecteur","projecteur2"]):
	{
		if (playerSide == civilian) exitWith {hint "Tu n'es pas habilité pour utiliser ca !"};
		[_item] spawn life_fnc_poserobjet;
	};	
	case (_item == "heroinp"):
	{
		if((player GVAR ["Druged",FALSE])) exitWith {hint "Vous consommez deja de le drogue ";};
		if(([false,_item,1] call life_fnc_handleInv)) then
	{
		if(isNil "life_drug") then {life_drug = 0;};
		life_drug = life_drug + 0.09;
		if (life_drug < 0.00) exitWith {};
		[] spawn life_fnc_heroin;
		};
	};
	case (_item == "cokep"):
	{
		if((player GVAR ["Druged",FALSE])) exitWith {hint "Vous consommez deja de la drogue ";};
		if(([false,_item,1] call life_fnc_handleInv)) then
	{
		if(isNil "life_drug") then {life_drug = 0;};
		life_drug = life_drug + 0.08;
		if (life_drug < 0.00) exitWith {};
		[] spawn life_fnc_coke;
	};
	};
	case (_item in ["marijuana","marijuanam"]):
	{
		if((player GVAR ["Druged",FALSE])) exitWith {hint "Vous consommez deja de la drogue ";};
		if(([false,_item,1] call life_fnc_handleInv)) then
	{
		[_item] spawn life_fnc_weed;
		};
	};
	case (_item == "meth97"):
	{
		if((player GVAR ["Druged",FALSE])) exitWith {hint "Vous consommez deja de la drogue !";};
		if(([false,_item,1] call life_fnc_handleInv)) then
	{
		if(isNil "life_drug") then {life_drug = 0;};
		life_drug = life_drug + 0.1;
		if (life_drug < 0.00) exitWith {};
		[] spawn life_fnc_meth;
		};
	};
	case (_item == "opium"):
	{
		if((player GVAR ["Druged",FALSE])) exitWith {hint "Vous consommez deja de la drogue !";};
		if(([false,_item,1] call life_fnc_handleInv)) then
	{
		if(isNil "life_drug") then {life_drug = 0;};
		life_drug = life_drug + 0.09;
		if (life_drug < 0.00) exitWith {};
		[] spawn life_fnc_opium;
		};
	};	
	case (_item == "cigarette"):
	{
		if((player GVAR ["Druged",FALSE])) exitWith {hint "Vous consommez deja de la drogue !";};
		if(([false,_item,1] call life_fnc_handleInv)) then
	{
		if(isNil "life_drug") then {life_drug = 0;};
		life_drug = life_drug + 0.01;
		if (life_drug < 0.00) exitWith {};
		[] spawn life_fnc_cigarette;
		};
	};
	case (_item == "wine"):
	{
		if((player GVAR ["inDrink",FALSE])) exitWith {hint "Vous etes deja en train de boire";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.03;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkwine;
		};
	};
	case (_item == "bottledwhiskey"):
	{
		if((player GVAR ["inDrink",FALSE])) exitWith {hint "Vous etes deja en train de boire";};
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
		if((player GVAR ["inDrink",FALSE])) exitWith {hint "Vous etes deja en train de boire";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};
	case (_item == "bottledbeer"):
	{
		if((player GVAR ["inDrink",FALSE])) exitWith {hint "Vous etes deja en train de boire";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			life_redgull_effect = time;
			titleText["Vous pouvez maintenant courir plus longtemps pendant 3 minutes","PLAIN"];
				player enableFatigue false;
			[] spawn
			{
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	case (_item == "zipties"):
	{
		if(playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget GVAR ["surrender", true] && cursorTarget distance player < 3 && isPlayer cursorTarget && !(cursorTarget GVAR "Escorting") && !(cursorTarget GVAR "restrained") && speed cursorTarget < 1 && animationState cursorTarget == "Incapacitated") then
		{
			if(([false,"zipties",1] call life_fnc_handleInv)) then
				{
					[] call life_fnc_restrainAction;
				};
		};
		if(playerSide == west) then
		{
			if(([false,"zipties",1] call life_fnc_handleInv)) then
				{
					[] call life_fnc_restrainAction;
				};
		};
	};
	case (_item == "camisole"):
	{
	if(playerSide == independent && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget GVAR ["surrender", true] && cursorTarget distance player < 3 && isPlayer cursorTarget && !(cursorTarget GVAR "Escorting") && !(cursorTarget GVAR "restrained") && speed cursorTarget < 1) then
		{
			if(([false,"camisole",1] call life_fnc_handleInv)) then
				{
					[] call life_fnc_restrainMed;
				};
		};
	};
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Vous avez deja une herse de deployée"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	case (_item in ["mur","sac","cone","barre","lightr","lightg","lighty","flecheg","fleched"]):
	{
		[_item] spawn life_fnc_placerobjet;
	};
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Vous ne pouvez pas faire le plein quand vous etes dans le vehicule !"};
		[] spawn life_fnc_jerryRefuel;
	};
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;closeDialog 0;
	};
	case (_item in ["apple","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","grapes","frite","redburger","henrawp","roosterrawp","sheeprawp","goatrawp","rabbitrawp"]):
	
	{
		if(!(EQUAL(M_CONFIG(getNumber,"ANL_VItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"ANL_VItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; 
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
				if(_item in ["redburger","tbacon","turtlesoup"] && (life_drink > 0.00 || life_drug > 0.00)) then {
					if(life_drink <= 0.02) then {life_drink = 0.00;} else {life_drink = life_drink - 0.02;};				
					if(life_drug <= 0.02) then {life_drug = 0.00;} else {life_drug = life_drug - 0.02;};				
				};
			};
		};
	};
	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	case (_item == "battery"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
		    closeDialog 0;
			life_battery = 100;
			hint "Votre batterie est pleine maintenant.";
		};
	};
	case (_item == "kidney"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player SVAR["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};
	case (_item == "nitro"):
	{
		[] spawn life_fnc_nitro;closeDialog 0;
	};
	case (_item == "speedbomb"):
	{
		[] spawn life_fnc_speedBomb;closeDialog 0;
	};
	case (_item == "vammo"):
	{
		[] spawn life_fnc_vehAmmo;
	};
	case (_item == "excavator"):
	{
		[] spawn life_fnc_searchWreck;
	};
	case (_item == "underwatercharge"): {
		player reveal gold_safe;
		(grpPlayer) reveal gold_safe;
		[cursorTarget] spawn life_fnc_underwaterCharge;
	};
	case (_item == "gpstracker"): {
		[cursorTarget] spawn life_fnc_gpsTracker;closeDialog 0;
	};
	case (_item ==  "multipass"):
	{
		[] spawn life_fnc_multipass;closeDialog 0;
	};
	case (_item ==  "scalpel"):
	{
	    closeDialog 0;
		titleText["Cet objet sert a prelever les organes, menottez votre victime avant de pouvoir l'utiliser !","PLAIN"];
	};
	case (_item in ["tente1","tente2"]):
	{
		[_item] spawn life_fnc_tent;
	};
	default
	{
		closeDialog 0;
		titleText["Cet objet ne s'utilise pas comme ca, essayez dans une zone precise ou sur un habitant !","PLAIN"];
	};
};
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;