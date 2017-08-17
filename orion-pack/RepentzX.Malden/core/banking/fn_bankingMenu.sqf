#include "..\..\script_macros.hpp"
/*
 * Author: Alexy (DiabolicaTrix)
 * Description: Opens the banking menu
*/
if (!life_use_atm) exitWith {
    hint format [localize "STR_Shop_ATMRobbed",(LIFE_SETTINGS(getNumber,"noatm_timer"))];
};

if(!dialog) then {
  if (!(createDialog "Life_banking_management")) exitWith {};
};
