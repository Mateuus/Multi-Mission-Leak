#include "..\..\script_macros.hpp"
/*
        File: fn_adminAtm.sqf
        Author: ColinM9991
        Description:
*/
if(FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";}; 
     
while {dialog} do {
        closeDialog 0;
        sleep 0.01;
};
sleep 0.01;  
[] call life_fnc_atmMenu;