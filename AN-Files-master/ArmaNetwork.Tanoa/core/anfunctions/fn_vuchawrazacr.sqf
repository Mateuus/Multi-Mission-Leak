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
_control = _this select 0;
_type = _this select 1;

_configType = switch(_type)do{
  case 0: {"clothing"};
  case 1: {"headgear"};
  case 2: {"glasses"};
};

customization_type = switch(_type)do {
  case 0: {0};
  case 1: {1};
  case 2: {2};
};

_list = ((findDisplay 700) displayCtrl 2500);
lbClear _list;
{
	_className = configName _x;
  _requirement = getText(missionConfigFile >> "CfgCustomization" >> _className >> "requirement");
  if(_requirement isEqualTo "") then {
    _requirement = compile "true";
  } else {
    _requirement = compile _requirement;
  };
  if(call _requirement) then {
    _classNameInfo = [_className] call life_fnc_thagawrepru;
    _list lbAdd format["%1",_classNameInfo select 1];
    _list lbSetPicture [(lbSize _list)-1,(_classNameInfo select 2)];
    _list lbSetData [(lbSize _list)-1,_className];
    _list lbSetValue [(lbSize _list)-1,_ForEachIndex];
  };
} forEach ("true" configClasses (missionConfigFile >> "CfgCustomization" >> _configType));
