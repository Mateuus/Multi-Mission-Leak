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
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	case (_item == "margarita"): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_hunger = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				hint "Oh man hat die Pizza lecker geschmeckt... Ich fühl mich als könnte ich nen Halbmarathon laufen...";
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (1 * 60))};
				player enableFatigue true;
			};
		};
	};
	case (_item == "calzone"): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_hunger = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				hint "Oh man hat die Pizza lecker geschmeckt... Ich fühl mich als könnte ich nen Halbmarathon laufen...";
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (1 * 60))};
				player enableFatigue true;
			};
		};
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
	
	case (_item in ["lagerkiste"]): {
		[_item] call life_fnc_storageBoxLager;
	};
	case (_item in ["usb"]): {
		[] spawn life_fnc_useusb;
	};
	case (_item in ["megaphone"]): {
		[] spawn life_fnc_usemegaphone;
	};
	
	case (_item == "barricade"):
	{
		if(!isNull life_barricade) exitWith {hint "Du stellst schon eine Barrikade!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barricade;
		};
	};
	
	
	case (_item == "barrier"):
	{
		if(!isNull life_barrier) exitWith {hint "Du stellst schon eine Barriere!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
		[] spawn life_fnc_barrier;
		};
	};

	case (_item == "strahler"):
	{
		if(!isNull life_barrier) exitWith {hint "Du stellst schon einen Strahler!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
		[] spawn life_fnc_strahler;
		};
	};
	case (_item == "schnaps"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
        [2] spawn life_fnc_alkohol;
		};
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
	
	case (_item == "spikeStrip"):
	{
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
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};
		case (_item == "marijuana"):
	{

		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMarihuana;
		};
	};
	
	case (_item == "heroinp"):
	{

		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};
	case (_item == "sense"):
	{

		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
			[] spawn life_fnc_useKokain;
			[2] spawn life_fnc_alkohol;
		};
	};
	
	case (_item == "methp"):
	{

		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};
	case (_item == "lsdp"):
	{

		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};
	case (_item == "cocainep"):
	{

		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};
	case (_item == "brenn"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            [] spawn life_fnc_usebrenn;
        };
    };
	case (_item == "bpzafir"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_zafir = true;
        };
    };
	case (_item == "bplrr"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_lrr = true;
        };
    };
	case (_item == "bplynx"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_lynx = true;
        };
    };
	case (_item == "bpmarten"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_marten= true;
        };
    };
	case (_item == "bpmk1"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_mk1= true;
        };
    };
	case (_item == "bpakm"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_akm= true;
        };
    };
	case (_item == "bpspar17"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_spar17= true;
        };
    };
	case (_item == "bpak12"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_ak12= true;
        };
    };
	case (_item == "bpmk14"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_mk14= true;
        };
    };
	case (_item == "bpmk18"): 
    {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {    
            license_civ_mk18= true;
        };
    };
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;