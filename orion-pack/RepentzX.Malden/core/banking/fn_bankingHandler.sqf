private["_control","_code","_shift","_ctrlKey","_alt","_handled"];
_handled = false;

//Esc Key Handler
if ((_this select 1) isEqualTo 1) then {
  _handled = true;
  [1] spawn life_fnc_insertCard;
};

_handled;
