/*
 * Author: Alexy (DiabolicaTrix)
 * Description: Card inserted
*/
private["_sound"];
params [
  ["_param", 0, [0]]
];

if(_param == 1) then {
  if(life_banking_isclosing) exitWith {};
  life_banking_isclosing = true;
  _sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
  waitUntil {isNull _sound};
  life_banking_isclosing = false;
  closeDialog 0;
};