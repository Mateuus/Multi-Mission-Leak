#include "..\..\script_macros.hpp"
/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if ((lbCurSel 2005) isEqualTo -1) exitWith {[localize "STR_ISTR_SelectItemFirst",5,"gray"] call RPG_Fnc_Msg;};
_item = CONTROL_DATA(2005);

switch (true) do {
    case (_item in ["waterBottle","coffee","redgull"]): {
        if ([false,_item,1] call life_fnc_handleInv) then {
            life_thirst = 100;

            player say3D "drink";

            if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 0;};
            if (_item isEqualTo "redgull" && {LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1}) then {
                [] spawn {
                    life_redgull_effect = time;
                    [localize "STR_ISTR_RedGullEffect",5,"blue"] call RPG_Fnc_Msg;
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

    case (_item isEqualTo "defusekit"): {
        [cursorObject] spawn life_fnc_defuseKit;
        closeDialog 0;
    };

    case (_item isEqualTo "storagesmall"): {
        [false] call life_fnc_storageBox;
    };

    case (_item isEqualTo "storagebig"): {
        [true] call life_fnc_storageBox;
    };

    case (_item isEqualTo "spikeStrip"): {
        //if (!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"; closeDialog 0};
        if ([false,_item,1] call life_fnc_handleInv) then {
            [] spawn life_fnc_spikeStrip;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "fuelFull"): {
        if !(isNull objectParent player) exitWith {[localize "STR_ISTR_RefuelInVehicle",5,"gray"] call RPG_Fnc_Msg;};
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

    case (_item isEqualTo "zipties"):
    {
        [] spawn life_fnc_civrestrainAction;
        closeDialog 0;
    };

    case (_item isEqualTo "nitro"):
    {
        [] spawn life_fnc_nitro;
        closeDialog 0;
    };

    case (_item isEqualTo "panicbutton"):
    {
        if( side player isEqualTo west && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed ) then {
            [] spawn life_fnc_panicButton;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "cprKit"):
    {
        [] spawn life_fnc_cprKit;
        closeDialog 0;
    };

    case (_item isEqualTo "lockpick"): {
        [] spawn life_fnc_lockpick;
        closeDialog 0;
    };
    
    case (_item isEqualTo "marijuana"): {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {
            [] spawn life_fnc_weed;
            closeDialog 0;
        };
    };

    case (_item isEqualTo "lsd"): {
        if(([false,_item,1] call life_fnc_handleInv)) then
        {
            [] spawn life_fnc_lsd;
            closeDialog 0;
        };
    };

    case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach","froglegs"]): {
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
                _val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
                _sum = life_hunger + _val;
                player say3D "eat";

                switch (true) do {
                    case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
                    case (_sum > 100): {life_hunger = 100;};
                    default {life_hunger = _sum;};
                };
            };
        };
    };

    default {
        [localize "STR_ISTR_NotUsable",5,"gray"] call RPG_Fnc_Msg;
    };
};

[] call life_fnc_inv;
[] call life_fnc_hudUpdate;