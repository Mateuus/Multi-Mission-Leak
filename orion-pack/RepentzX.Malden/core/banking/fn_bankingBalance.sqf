/*
 * Author: Alexy (DiabolicaTrix)
 * Description: Opens the balance menu
*/
if(isNull (findDisplay 45050)) then {
  if (!(createDialog "Life_banking_balance")) exitWith {};
};
disableSerialization;

((findDisplay 45050) displayCtrl 45051) ctrlSetStructuredText parseText format["<img size='1.7' image='images\icons\ico_bank.paa'/> $%1<br/><img size='1.6' image='images\icons\ico_money.paa'/> $%2",[life_fishFinder] call life_fnc_numberText,[life_houseProtect] call life_fnc_numberText];
