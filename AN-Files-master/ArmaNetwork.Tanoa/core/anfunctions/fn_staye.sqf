/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_giveKeysPlayer",objNull,[objNull]]
];
if(isNull _giveKeysPlayer OR {isNil "_giveKeysPlayer"} OR {!alive _giveKeysPlayer}) exitWith {};
createDialog "give_keys";
disableSerialization;
_display = findDisplay 57635;
_list = _display displayCtrl 1500;
lbClear _list;
(_display displayCtrl 1001) ctrlSetText "Give Keys";

{
  _vehicle = _x;
  if(!isNull _vehicle && {alive _vehicle}) then {
    _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
    _pic = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "picture");
    if(("vehgps" in AN_Skills) OR {playerSide isEqualTo west}) then {
      _list lbAdd format["%1 - [Distance: %2m]",_name,round(player distance _vehicle)];
    } else {
      _list lbAdd format["%1",_name];
    };
    if(_pic != "pictureStaticObject") then {
      _list lbSetPicture [(lbSize _list)-1,_pic];
    };
    _list lbSetData [(lbSize _list)-1,str(_forEachIndex)];
  };
} forEach life_vehicles;
