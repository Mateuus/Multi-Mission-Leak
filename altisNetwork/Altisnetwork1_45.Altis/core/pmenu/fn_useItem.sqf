#include "..\..\script_macros.hpp"
/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if ((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
    case (_item in ["waterBottle","coffee","redgull"]): {
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

    case (_item isEqualTo "boltcutter"): {
        [cursorObject] spawn life_fnc_boltcutter;
        closeDialog 0;
    };

    case (_item isEqualTo "blastingcharge"): {
        player reveal fed_bank;
        (group player) reveal fed_bank;
        [cursorObject] spawn life_fnc_blastingCharge;
        closeDialog 0;
    };

	case (_item isEqualTo "codeCracker"): {
        player reveal fed_bank_1;
        (group player) reveal fed_bank_1;
        [cursorObject] spawn life_fnc_codeCracker;
        closeDialog 0;
    };
	
    case (_item isEqualTo "defusekit"): {
        [cursorObject] spawn life_fnc_defuseKit;
        closeDialog 0;
    };
/*
	case (_item isEqualTo "gpstracker"): {
		[cursorTarget] spawn life_fnc_gpsTracker;
	};
*/
    case (_item isEqualTo "gpstracker"):
    {
        if( side player isEqualTo west ) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
            [] spawn life_fnc_gpsTracker;
            closeDialog 0;
        };
    };
};

    case (_item isEqualTo "carC4"):
    {
        if( side player isEqualTo west ) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
            [cursorTarget] spawn life_fnc_carC4;
            closeDialog 0;
        };
    };
};

    case (_item isEqualTo "storagesmall"): {
        [false] call life_fnc_storageBox;
    };

    case (_item isEqualTo "storagebig"): {
        [true] call life_fnc_storageBox;
    };
/*
    case (_item isEqualTo "spikeStrip"): {
        if (!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"; closeDialog 0};
            if ([false,_item,1] call life_fnc_handleInv) then {
                [] spawn life_fnc_spikeStrip;
                closeDialog 0;
            };
    };
*/

    case (_item isEqualTo "spikeStrip"):
    {
        if( side player isEqualTo west ) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
            [] spawn life_fnc_spikeStrip;
            closeDialog 0;
        };
    };
};

    case (_item isEqualTo "fuelFull"): {
        if (vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
        [] spawn life_fnc_jerryRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
        [] spawn life_fnc_jerrycanRefuel;
        closeDialog 0;
    };
//--CPR Perk

    if ([life_currentExpPerks, "perk_cpr_1"] call mav_ttm_fnc_hasPerk) then 
    {
        case (_item isEqualTo "cprKit"):
            {
                //[] spawn life_fnc_cprKit;
            };
    };

//  -- lockpicks
    case (_item isEqualTo "lockpick"): 
    {
        [] spawn life_fnc_lockpick;
        closeDialog 0;
    };
	
// -- Morphine	
	case (_item isEqualTo "morphine"): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_morphine;
		};
	};
	
//-- Apple Cider
	case (_item isEqualTo "apple_cider"): {
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_alcohol;
		};
	};
	
// -- Weed
    case (_item isEqualTo "marijuana"): {
    if(([false,_item,1] call life_fnc_handleInv)) then
	{
        [] spawn life_fnc_weed;
		};
    };


    case (_item isEqualTo "panicbutton"):
    {
        if( side player isEqualTo west && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed ) then {
            [] spawn life_fnc_panicButton;
        };
    };

	case (_item isEqualTo "snapgun"): {
		[] spawn life_fnc_snapgun;
		closeDialog 0;
	};
	
	case (_item isEqualTo "ziptie"): {
        [cursorObject] spawn life_fnc_ziptieAction;
        closeDialog 0;
    };

    case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
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
        hint localize "STR_ISTR_NotUsable";
    };
};

[] call life_fnc_p_updateMenu;
//[] call life_fnc_hudUpdate;