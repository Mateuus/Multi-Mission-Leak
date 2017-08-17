/*
 * Author: Alexy (DiabolicaTrix)
 * Description: Opens the main menu
*/
if(isNull (findDisplay 45070)) then {
  if (!(createDialog "Life_banking_main")) exitWith {};
};

if (isNil {(group player getVariable "gang_bank")}) then {
    ((findDisplay 45070) displayCtrl 45075) buttonSetAction "";
    ((findDisplay 45070) displayCtrl 45076) buttonSetAction "";
    ((findDisplay 45070) displayCtrl 45065) ctrlShow false;
    ((findDisplay 45070) displayCtrl 45066) ctrlShow false;
};
