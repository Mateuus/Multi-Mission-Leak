/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if!(playerSide isEqualTo civilian) exitWith {hintSilent "Not authorized to access this";};
disableSerialization;
createDialog "list_contract";
if(isNil "listcontractsearch") then {listcontractsearch = [];};
_display = findDisplay 50000;
_list = _display displayCtrl 1500;
(findDisplay 50000) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"];
lbClear _list;
_justPlayers = allPlayers - entities "HeadlessClient_F";
_units = [];
{
	_name = _x getVariable ["realname",name _x];
	if(alive _x && {_x != player}) then {
		_list lbAdd format["%1",_x getVariable ["realname",name _x]];
		_list lbSetData [(lbSize _list)-1,str(_x)];
		listcontractsearch pushBack [_x getVariable ["realname",name _x],str(_x)];
	};
} forEach _justPlayers;
