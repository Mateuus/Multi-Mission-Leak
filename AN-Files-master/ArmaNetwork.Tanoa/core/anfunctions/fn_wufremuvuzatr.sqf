/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_searchbox = (((findDisplay 2700) displayCtrl 1400));
_playerList = (((findDisplay 2700) displayCtrl 1500));
_nameList = [];
if((ctrlText _searchbox) != "") then {
	{
		lbClear _playerList;
		if([(_x select 0),(ctrlText _searchbox)] call KRON_StrInStr) then
		{
			_nameList pushback _x;
		};
	} forEach ATMSearch;
} else {
	lbClear _playerList;
	_nameList = ATMSearch;
};

{
	_playerList lbAdd format ["%1 - %2",_x select 0,_x select 1];
	_playerList lbSetData [(lbSize _playerList)-1,_x select 2];
	lbSort _playerList;
} forEach _nameList;

if (lbSize _playerList > 0) then {
	_playerList lbSetCurSel 0;
} else {
  _playerList lbSetCurSel -1;
};
