/*
  ArmA.Network
  Rathbone
  Switches between selected option from Combobox
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_type = param[0,-1,[0]];
if(_type isEqualTo -1) exitWith {[1] call life_fnc_playerCustomization;hintSilent "Error - Report to Admin";};
if(isNull (findDisplay 700)) exitWith {};
if(lbCurSel 2500 isEqualTo -1) exitWith {hintSilent "You haven't selected an item";};  
_arrayToSave = profileNamespace getVariable "iyytfasdfgaf";
if(isNil "_arrayToSave") then {_arrayToSave = ["","",""];};
_selected = lbData[700,(lbCurSel 2500)];
switch(_type)do{
  case 0: {
    _arrayToSave set[0,_selected];
    profileNamespace setVariable ["iyytfasdfgaf",_arrayToSave];
  };
  case 1: {
    _arrayToSave set[1,_selected];
    profileNamespace setVariable ["iyytfasdfgaf",_arrayToSave];
  };
  case 2: {
    _arrayToSave set[2,_selected];
    profileNamespace setVariable ["iyytfasdfgaf",_arrayToSave];
  };
};
hintSilent "Saved Item will shown on next respawn!";
((findDisplay 700) displayCtrl 3400) ctrlEnable false;
