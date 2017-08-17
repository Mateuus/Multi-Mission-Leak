#include "..\..\script_macros.hpp"
/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if ((lbCurSel 2005) isEqualTo -1) exitWith {[localize "STR_ISTR_SelectItemFirst",true,"slow"] call life_fnc_notificationSystem;};
_item = CONTROL_DATA(2005);

switch (true) do {
    case (_item in ["waterBottle","coffee","redgull","pepsi","cocaCola","monsterEnergy"]): {
        if ([false,_item,1] call life_fnc_handleInv) then {
            life_thirst = 100;
            if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 0;};
            if (_item isEqualTo "redgull" && {LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1}) then {
                [] spawn {
                    life_redgull_effect = time;
                    titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
                    player enableFatigue false;
                    waitUntil {!alive player || ((time - life_redgull_effect) > (3 * 60))};
                    player enableFatigue true;
                };
            };
        };
    };

    case (_item isEqualTo "boltcutter"): 
	{
        [cursorObject] spawn life_fnc_boltcutter;
        closeDialog 0;
    };

    case (_item isEqualTo "airhorn"): 
	{
		if!(isNull life_airhorn) exitWith {["Your Airhorn has already been unpacked!",false,"slow"] call life_fnc_notificationSystem;};
		[] call life_fnc_airhorn;
        closeDialog 0;
	};

	case (_item isEqualTo "dogwhistle"):
	{
		if(player getVariable["hasDog",false]) exitWith {["You already have a dog!",false,"slow"] call life_fnc_notificationSystem;};
		
		[player] spawn life_fnc_activateDog;
	};

	case (_item == "demolitioncharge"):
	{
		player reveal prison_safe;
		(group player) reveal prison_safe;
		[cursorTarget] spawn life_fnc_wallCharge;
		closeDialog 0;
	};

    case (_item isEqualTo "volleyball"): {
		[0] call life_fnc_volleyball;
        closeDialog 0;
	}; 

    case (_item isEqualTo "prize"): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			closedialog 0;
			[] spawn life_fnc_prize;
		};
	};

	case (_item isEqualTo "cyanideCapsule"): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
		[] spawn {
				hint "Goodbye cruel world...";
				[0,format["%1 has taken the easy way out with a cyanide capsule"],name player] remoteExecCall ["life_fnc_broadcast",RCLIENT];
				sleep 3;
				player setdamage 1;
			};
		};
	};
	
	case (_item isEqualTo "gokart"):
	{
		[] spawn life_fnc_gokart;
		closeDialog 0;
	};

	case (_item == "flashlight"):
	{
		[] spawn life_fnc_Flashlight;
		closeDialog 0;
	};

	case (_item isEqualTo "panicbutton"): {
		[] spawn life_fnc_callbackup;
        closeDialog 0;
	};

	case (_item isEqualTo "speedbomb"): {
		[] spawn life_fnc_speedBomb;
        closeDialog 0;
	};


    case (_item in ["tent1"]):
	{
		[_item] spawn life_fnc_tent;
        closeDialog 0;
	};

    case (_item isEqualTo "gpstracker"): {
		[cursorTarget] spawn life_fnc_gpsTracker; closeDialog 0;
	};


    case (_item isEqualTo "campfire"):
	{
		if (vehicle player != player) exitWith{ _exit = true; ["Starting a fire in a vehicle is hazardous to your health!",false,"slow"] call life_fnc_notificationSystem;};
		//if (player distance (getMarkerPos "city") < 1000 || player distance (getMarkerPos "civ_spawn_2") < 1000 || player distance (getMarkerPos "civ_spawn_3") < 500 || player distance (getMarkerPos "civ_spawn_4") < 500) exitWith { ["Creating campfires too close to a city center is prohibited!",false,"slow"] call life_fnc_notificationSystem; };
		if (count (nearestObjects [player, ["Land_Campfire_F"], 25]) > 0) exitWith { ["There's already a campfire nearby!",false,"slow"] call life_fnc_notificationSystem; };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["You create a simple campfire using the contents of a campfire kit.","PLAIN"];
			_fire = "Land_Campfire_F" createVehicle (getPos player);
			_fire setVariable ["owner", player, true];
			_fire addAction["Cook Raw Meat",life_fnc_cookMeat,cursorObject,-1,false,false,"",'!isNull cursorObject && (player distance cursorObject) < 4 && (typeOf cursorObject) == "Land_Campfire_F" && inflamed cursorObject && (life_inv_chicken > 0 || life_inv_sheep > 0 || life_inv_goat > 0) '];
			_fire addAction["Clean Up Campfire",{deleteVehicle cursorObject},cursorObject,-1,false,false,"",'!isNull cursorObject && (player distance cursorObject) < 4 && (typeOf cursorObject) == "Land_Campfire_F" '];
		};
	};

    case (_item isEqualTo "protest"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_protest;
		};
	};

    case (_item isEqualTo "head"): {
		if (vehicle player != player) exitWith {["You can't be in a car!",false,"slow"] call life_fnc_notificationSystem;};
		if(!isNull life_head) exitWith {["You already have a head!",false,"slow"] call life_fnc_notificationSystem;};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_head;
		};
	};

    case (_item isEqualTo "defusekit"): {
        [cursorObject] spawn life_fnc_defuseKit;
        closeDialog 0;
    };
    
    _itemConverted = getText(missionConfigFile >> "CfgDonkeyPunchCustoms" >> _item);
	_lifeContainers = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "LifeContainers");
	_lifeFurniture = getArray(missionConfigFile >> "CfgDonkeyPunchCustoms" >> "BuildableFurniture");
	_lifeContainers = _lifeContainers + _lifeFurniture;
	case (_itemConverted in _lifeContainers): {
        [_item] call life_fnc_storageBox;
		["WARNING: Placing items outside your housing limits, underneath or above may lead to your removal from the server! Use your keyboard [page up, page down, all num pad buttons, shift, ctrl, arrow keys] to position, rotate, angle slow down or speed up the object, then press space to place the object!, if you wish to remove it, it will go back into your inventory.",true,"slow"] call life_fnc_notificationSystem;
    };

    case (_item isEqualTo "spikeStrip"): {
        if (!isNull life_spikestrip) exitWith {[localize "STR_ISTR_SpikesDeployment",true,"slow"] call life_fnc_notificationSystem; closeDialog 0};
        if ([false,_item,1] call life_fnc_handleInv) then {
            [] spawn life_fnc_spikeStrip;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "fuelFull"): {
        if !(isNull objectParent player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
        [] spawn life_fnc_jerryRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
        [] spawn life_fnc_jerryCanRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "lockpick"): {
        [] spawn life_fnc_lockpick;
        closeDialog 0;
    };

    case (_item isEqualTo "morphine"):
	{
		[] spawn life_fnc_morphine;
	};

	case (_item isEqualTo "bandages"):
	{
		[] spawn life_fnc_bandages;
	};

    case (_item isEqualTo "cprKit"):
    {
        [] spawn life_fnc_cprKit;
    };

    //DRUGS/*
    case (_item isEqualTo "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
    };

    case (_item isEqualTo "beer"): {
		if(playerSide in [west,independent]) exitWith {[localize "STR_MISC_WestIndNoNo",true,"slow"] call life_fnc_notificationSystem;};
		if((player getVariable ["inDrink",FALSE])) exitWith {[localize "STR_MISC_AlreadyDrinking",true,"slow"] call life_fnc_notificationSystem;};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
		};
	};

    case (_item isEqualTo "whiskey"): {
		if(playerSide in [west,independent]) exitWith {[localize "STR_MISC_WestIndNoNo",true,"slow"] call life_fnc_notificationSystem;};
		if((player getVariable ["inDrink",FALSE])) exitWith {[localize "STR_MISC_AlreadyDrinking",true,"slow"] call life_fnc_notificationSystem;};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
		};
	};

     case (_item isEqualTo "moonshine"): {
		if(playerSide in [west,independent]) exitWith {[localize "STR_MISC_WestIndNoNo",true,"slow"] call life_fnc_notificationSystem;};
		if((player getVariable ["inDrink",FALSE])) exitWith {[localize "STR_MISC_AlreadyDrinking",true,"slow"] call life_fnc_notificationSystem;};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
		};
	};

    case (_item isEqualTo "cocaine_processed"):
	{
		if(playerSide in [west,independent]) exitWith {["You can't take drugs on duty!",false,"slow"] call life_fnc_notificationSystem;};
		if((player getVariable ["Druged",FALSE])) exitWith {["You are already high!",false,"slow"] call life_fnc_notificationSystem;};
		if(([false,_item,1] call life_fnc_handleInv)) then
			{
				if(isNil "life_drug") then {life_drug = 0;};
				life_drug = life_drug + 0.08;
				if (life_drug < 0.00) exitWith {};
				[] spawn life_fnc_Cocaine;
			};
	};

    case (_item isEqualTo "heroin_processed"):
	{
		if(playerSide in [west,independent]) exitWith {["You can't take drugs on duty!",false,"slow"] call life_fnc_notificationSystem;};
		if((player getVariable ["Druged",FALSE])) exitWith {["You are already high!",false,"slow"] call life_fnc_notificationSystem;};
		if(([false,_item,1] call life_fnc_handleInv)) then
			{
				if(isNil "life_drug") then {life_drug = 0;};
				life_drug = life_drug + 0.08;
				if (life_drug < 0.00) exitWith {};
				[] spawn life_fnc_Heroin;
			};
	};
    //ENDDRUGS

    case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach","doritos","shittynoodles","kfc","easterEggs"]): {
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
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

    default {
        [localize "STR_ISTR_NotUsable",true,"slow"] call life_fnc_notificationSystem;
    };
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
[] call life_fnc_inventory;