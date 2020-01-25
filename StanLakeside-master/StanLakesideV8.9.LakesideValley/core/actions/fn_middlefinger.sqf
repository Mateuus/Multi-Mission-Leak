/*
cunt
*/

if(life_action_inuse) exitWith {};
if(life_istazed) exitWith {};
if((animationState player) == "Incapacitated") exitWith {};
if (vehicle player != player) exitwith { };

player playActionNow "gesturefinger";