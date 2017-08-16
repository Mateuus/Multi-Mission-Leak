/*
  ArmA.Network
  Rathbone
  Selects Magazine from Weapon Shop
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
_display = findDisplay 42125;
_control = _this select 0;
_index = _this select 1;
if(_index isEqualTo -1) exitWith {};
_className = _control lbData _index;
_wIndex = _control lbValue _index;
_basePrice = getNumber(missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
_weaponInfoTwo = [_className] call life_fnc_stecranuyer;
_description = (_weaponInfoTwo select 2);
if(_description isEqualTo "") then {_description = "None"};
(_display displayCtrl 1101) ctrlSetStructuredText parseText format[
"Name: <t color='#ffae2b'>%1</t><br/>Price: <t color='#27e640'>$%2</t><br/>Description:<br/><t color='#ffae2b'>%3</t>",
(_weaponInfoTwo select 1),
[_basePrice] call life_fnc_rupadudejat,
_description
];
