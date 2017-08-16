/*
  ArmA.Network
  Rathbone
  Hit List fetched and displayed
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_targetGangName"];
disableSerialization;
params [
	["_info",[],[[]]]
];
diag_log _info;
_display = findDisplay 50001;
_list = _display displayCtrl 1500;
lbClear _list;
{
	_targetGangName = _x select 4;
	if (_targetGangName isEqualTo "") then {
		_list lbAdd "Unaffiliated Citizen";
	} else {
		_list lbAdd format["%1",format["[%1] Member",_targetGangName]];
	};
	_list lbSetData [(lbSize _list)-1,str(_x)];
} forEach _info;
