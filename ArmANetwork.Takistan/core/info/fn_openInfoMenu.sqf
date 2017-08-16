/**
*	ArmA.Network - DEV Team
*	Author: R4thbone
*	(c) by ArmA.Network 2016
*/
_mode = param [0,-1,[-1]];
_information = getArray(missionConfigFile >> "CfgInfo" >> "information");

disableSerialization;

switch(_mode) do {
  case 0:
  {
    if (!(isNull (findDisplay 432123))) exitWith {};
	  createDialog "infomenu";
	  _display = findDisplay 432123;
	  _infoList = _display displayCtrl 1500;
	  {
		_infoList lbAdd (_x select 0);
	  } forEach _information;
  };
  case 1:
  {
    _display = findDisplay 432123;
  	if(isNull _display) exitWith {};
  	_infoList = _display displayCtrl 1500;
  	_info = _display displayCtrl 1100;
  	_selection = lbCurSel _infoList;
  	_info ctrlSetStructuredText parseText ((_information select _selection) select 1);
  };
};
