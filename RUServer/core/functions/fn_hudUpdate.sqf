#include "..\..\script_macros.hpp"
//#define IDC_LIFE_BAR_SeatBelt 4203
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(2200) progressSetPosition (life_hunger / 100);
LIFEctrl(2201) progressSetPosition (1 - (damage player));
LIFEctrl(2202) progressSetPosition (life_thirst / 100);

if(!isNil "life_seatbelt") then {
    if ( vehicle player != player ) then {
        if(life_seatbelt) then {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons\Gurt_Geschlossen.paa";
        } else {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons\Gurt_Offen.paa";
        };
    } else {
        LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "";
    };
};
