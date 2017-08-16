/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/

if (player getVariable ["restrained", false]) exitWith {};

private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "You need to select an item first!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee" or _item == "soda"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			if (life_revive_fatigue == 0) then { player setFatigue 0; };
		};
	};
	
	case (_item in ["beer","moonshine","whiskeyc_1","whiskeyc_2","whiskeyc_3","whiskeyr_1","whiskeyr_2","whiskeyr_3","scotch_1","scotch_2","scotch_3","rum_0","rum_1","rum_2","rum_3","gingerale_0","gingerale_1","gingerale_2","gingerale_3"]):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			[_item] spawn life_fnc_beer;
		};
	};
	
	case (_item in ["treasure_1","treasure_2","treasure_3","treasure_4","treasure_5"]):
	{
		closeDialog 0;
		closeDialog 0;
		[_item] spawn life_fnc_showTreasure;
	};
	
	case (_item == "shovel"):
	{
		while {dialog} do {closeDialog 0};
		[] spawn life_fnc_dig;
	};
	
	case (_item == "ducttape"):
	{
		if(([false,"plateMetal",1] call life_fnc_handleInv)) then
		{
			[false,"ducttape",1] call life_fnc_handleInv;
			[true,"shank",1] call life_fnc_handleInv;
			hint "You crafted a shank from a piece of sharp scrap metal and duct tape.";
		}
		else
		{
			hint "You could craft a shank with this if you had something hard and sharp.";
		};
	};
	
	case (_item == "campfire"):
	{
		if (vehicle player != player) exitWith{ _exit = true; hint "Starting a fire in a vehicle is hazardous to your health!"};
		if (player distance (getMarkerPos "city") < 1000 || player distance (getMarkerPos "civ_spawn_2") < 1000 || player distance (getMarkerPos "civ_spawn_3") < 500 || player distance (getMarkerPos "civ_spawn_4") < 500) exitWith { hint "Creating campfires too close to a city center is prohibited!"; };
		if (count (nearestObjects [player, ["Land_Campfire_F"], 25]) > 0) exitWith { hint "There's already a campfire nearby!"; };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["You create a simple campfire using the contents of a campfire kit.","PLAIN"];
			_fire = "Land_Campfire_F" createVehicle (getPos player);
			_fire setVariable ["owner", player, true];
			_fire addAction["Cook Raw Meat",life_fnc_cookMeat,cursorObject,-1,false,false,"",'!isNull cursorObject && (player distance cursorObject) < 4 && (typeOf cursorObject) == "Land_Campfire_F" && inflamed cursorObject && (life_inv_chicken > 0 || life_inv_dog > 0 || life_inv_sheep > 0 || life_inv_goat > 0) '];
			_fire addAction["Clean Up Campfire",{deleteVehicle cursorObject},cursorObject,-1,false,false,"",'!isNull cursorObject && (player distance cursorObject) < 4 && (typeOf cursorObject) == "Land_Campfire_F" '];
		};
	};
	
	case (_item == "blindfold"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_blindfold;
		};
	};
	
	case (_item in ["","lootcrate1"] && life_inv_lootcrate1 > 0):
	{
		[1] call life_fnc_inspectLootCrate;
	};
	
	case (_item == "woodaxe"):
	{
		[] spawn life_fnc_woodAxe;
	};
	
	case(_item in ["defib","painkillers","splint","bloodbag"]):
	{
		titleText["This item is used via the action menu while looking at an injured person.","PLAIN"];
	};
	
	case (_item == "redgull"):
	{
		if (life_revive_fatigue > 0) exitWith { hint "This item has no effect due to revive fatigue." };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			life_redgull_effect = time;
			titleText["You can now run farther for 3 minutes","PLAIN"];
			player enableFatigue false;
			[] spawn
			{
				waitUntil {!alive player OR ((time - life_redgull_effect) > (2 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "vammo"):
	{
		[] spawn life_fnc_vehAmmo;
	};
	
	case (_item == "protest"):
	{
		[] spawn life_fnc_protest;
	};
	
	case(_item in ["roadCone","roadBarrier","cncBarrier","cncBarrierL","barGate","bagwallshort","bagwalllong","bagwallround","razorwire"]):
	{
		if (!(75 in life_talents) && playerSide == west) exitWith { hint "You have no idea how to use this."; };
		[_item] spawn life_fnc_placeObject;
	};
	
	case(_item == "ladder"):
	{
		if (life_roleSWAT != 2) exitWith { hint "This can only be used by the SWAT team leader."; };
		[_item] spawn life_fnc_placeObject;
	};
	
	case (_item == "pcp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setFatigue 1;
			[] spawn
			{
				life_pcp_effect = time;
				titleText["You can now run farther for 6 minutes","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_pcp_effect) > (5 * 60))};
				player enableFatigue true;
				
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "You already have a Spike Strip active in deployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "excavator"):
	{
		[] spawn life_fnc_searchWreck;
	};
		
	case (_item == "nitro"):
	{
		[] spawn life_fnc_nitro;
	};
	
	case (_item == "speedbomb"):
	{
		[] spawn life_fnc_speedBomb;
	};
	
	case (_item == "caralarm"):
	{
		[_item] spawn life_fnc_alarm;
	};
	case (_item == "airalarm"):
	{
		[_item] spawn life_fnc_alarm;
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "You can't refuel the vehicle while in it!"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item ==  "adrenalineShot"):
	{
		[] spawn life_fnc_adrenalineShot;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["storage1","storage2","agingbarrel"]):
	{
		[_item] call life_fnc_placeStorage;
	};
	
	case (_item in ["berry","ginger","banana","apple","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","redburger","chickenp","dogp","sheepp","goatp","rabbitp","snakep","toasty","sandwich"]):
	{
		[_item] call life_fnc_eatFood;
	};
	
	case (_item == "tracker"):
	{
		[] spawn life_fnc_tracker;
	};
		
	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (_item in ["marijuana","marijuanam","cocapaste"]):
	{
		[_item] spawn life_fnc_marijuana;
	};
	
	case (_item == "cocainep"):
	{
		[] spawn life_fnc_cocaine;
	};
	
	case (_item == "heroinp"):
	{
		[] spawn life_fnc_heroin;
	};
	
	case (_item == "meth"):
	{
		[] spawn life_fnc_meth;
	};
	
	case (_item in ["tent1","tent2"]):
	{
		[_item] spawn life_fnc_tent;
	};
	
	default
	{
		hint "This item isn't usable.";
	};
};
	
[false] call life_fnc_inventory;
[] call life_fnc_hudUpdate;