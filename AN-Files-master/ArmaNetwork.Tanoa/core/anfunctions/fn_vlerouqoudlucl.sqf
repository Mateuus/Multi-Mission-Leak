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
createDialog "list_contracts";
_display = findDisplay 50001;
_list = _display displayCtrl 1500;
_killers = _display displayCtrl 1501;
lbClear _list;
lbClear _killers;
[player] remoteExec ["life_fnc_hitlistFetch",2];
_units = [];
{
	_name = _x getVariable ["realname",name _x];
	_contractKiller = _x getVariable ["ContractAccepted",""];
	if(alive _x/*&& {_x != player}*/ && {!(_contractKiller isEqualTo "")}) then {
		_killers lbAdd format["%1",_x getVariable ["realname",name _x]];
		_killers lbSetData [(lbSize _killers)-1,str(_x)];
	};
} forEach (allPlayers - entities "HeadlessClient_F");
