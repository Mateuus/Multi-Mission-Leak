/*
 * Author: Alexy (DiabolicaTrix)
 * Description: Opening and initializing the pin menu
*/
private["_pinBox", "_pinText", "_pinHidden", "_pinHiddenText", "_pinArray"];
params [
  ["_pin", 0, [0]]
];

if(isNull (findDisplay 45080)) then {
  if (!(createDialog "Life_banking_pin")) exitWith {};
};
playSound "atmButton";
(findDisplay 45080) displaySetEventHandler ["keyDown","_this call life_fnc_bankingHandler"];

disableSerialization;
_pinBox = ((findDisplay 45080) displayCtrl 45088);
_pinBox ctrlEnable false;
_pinHidden  = ((findDisplay 45080) displayCtrl 45087);
_pinText = ctrlText _pinHidden;

if(_pin != -1 && _pin != -3) then {
  if(_pin != -2 && count (toArray _pinText) >= 4) exitWith {};
  if(_pin == -2 && count (toArray _pinText) <= 0) exitWith {};
  if(_pin == -2) then
  {
    _pinArray = _pinText splitString "";
    _pinText = "";
    for "_x" from 0 to ((count _pinArray) - 2) do {
      _pinText = _pinText + (_pinArray select _x);
    };
    _pinHidden ctrlSetText _pinText;
  } else {
    _pinText = _pinText + str _pin;
    _pinHidden ctrlSetText _pinText;
  };
  _pinHiddenText = "";
  {
    _pinHiddenText = _pinHiddenText + "*";
  } forEach (toArray _pinText);
  _pinBox ctrlSetText _pinHiddenText;
} else {
  if(_pin == -3) then {
    if(!(count (toArray _pinText) == 4)) exitWith {[localize "STR_Banking_InvalidPin",true,"slow"] call life_fnc_notificationSystem;};
    if(getNumber(missionConfigFile >> "Life_Banking" >> "pin_system") isEqualTo 1) then {
      if(life_bankingpin == (parseNumber _pinText)) then {
        [] spawn life_fnc_bankingMainMenu;
      } else {
        [localize "STR_Banking_WrongPin",true,"slow"] call life_fnc_notificationSystem;
      };
    } else {
      [] spawn life_fnc_bankingMainMenu;
    };
  };
};
