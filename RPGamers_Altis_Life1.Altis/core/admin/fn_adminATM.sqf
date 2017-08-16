#include "..\..\script_macros.hpp"
/*
        File: fn_adminAtm.sqf
        Author: ColinM9991
        Description:
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;}; 
     
while {dialog} do {
        closeDialog 0;
        sleep 0.01;
};
sleep 0.01;  
[] call life_fnc_atmMenu;