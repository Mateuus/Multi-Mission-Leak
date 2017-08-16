/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_mode = param [0,-1,[-1]];
_information = getArray(missionConfigFile >> "CfgInfo" >> str(playerSide) >> "information");
disableSerialization;
switch(_mode) do {
  case 0: {
    if (!(isNull (findDisplay 432123))) exitWith {};
	  createDialog "infomenu";
	  _display = findDisplay 432123;
	  _infoList = _display displayCtrl 1500;
	  {
		_infoList lbAdd (_x select 0);
	  } forEach _information;
  };
  case 1: {
    _display = findDisplay 432123;
  	if(isNull _display) exitWith {};
  	_infoList = _display displayCtrl 1500;
  	_info = _display displayCtrl 1100;
  	_selection = lbCurSel _infoList;
  	_info ctrlSetStructuredText parseText ((_information select _selection) select 1);
  };
};
