#include "..\..\script_macros.hpp"
//Hides body

if (mav_ttm_var_hideBody == 0) exitwith {["You need to learn how to dismantle bodies first!",true,"slow"] call life_fnc_notificationSystem;}; 
if (!(life_inv_knife > 0)) exitWith {["You need a knife to hide bodies",true,"slow"] call life_fnc_notificationSystem; };

player playMove "AinvPknlMstpSnonWnonDr_medic1";
sleep 6;
deleteVehicle cursorObject;
[false,"knife",1] call life_fnc_handleInv;
