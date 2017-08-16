#include "..\..\script_macros.hpp"
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

_zeit = if((life_real_time select 4)<=9)then{if((life_real_time select 3)<=9)then{format["0%1:0%2 %3.%4.%5",life_real_time select 3,life_real_time select 4,life_real_time select 2,life_real_time select 1,life_real_time select 0];}else{format["%1:0%2 %3.%4.%5",life_real_time select 3,life_real_time select 4,life_real_time select 2,life_real_time select 1,life_real_time select 0];};}else{if((life_real_time select 3)<=9)then{if((life_real_time select 4)<=9)then{format["%1:0%2 %3.%4.%5",life_real_time select 3,life_real_time select 4,life_real_time select 2,life_real_time select 1,life_real_time select 0];}else{format["0%1:%2 %3.%4.%5",life_real_time select 3,life_real_time select 4,life_real_time select 2,life_real_time select 1,life_real_time select 0];};}else{format["%1:%2 %3.%4.%5",life_real_time select 3,life_real_time select 4,life_real_time select 2,life_real_time select 1,life_real_time select 0];};};

LIFEctrl(1000) ctrlSetStructuredText parsetext format ["<t align='right'>%1 - %2 - %3</t>",(player getvariable ["realname",name player]),_zeit,(call ESG_DBID)];
LIFEctrl(1000) ctrlSetFade 0.3;
LIFEctrl(1000) ctrlCommit 0;