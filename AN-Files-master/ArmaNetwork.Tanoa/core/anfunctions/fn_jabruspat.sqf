/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if((group player getVariable ["gbank_in_use_by",""]) != getPlayerUID player) exitWith {hintSilent "Gang Funds are currently being used!";};
private["_value"];
_gangRank = player getVariable ["gangRank",-1];
if(_gangRank isEqualTo -1) exitWith {(findDisplay 2700) displayRemoveAllEventHandlers "KeyDown"; closeDialog 0;};
_allowedRank = if((getNumber(missionConfigFile >> "CfgGangs" >> format["gangrank_%1",_rank] >> "gangfunds")) isEqualTo 1) then {true} else {false};
if(_allowedRank) then {
  _value = parseNumber(ctrlText 1401);
  _gFund = (group player) getVariable ["gangBank",0];
  if(_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
  if(_value <= 0) exitWith {};
  if(!([str(_value)] call life_fnc_spunetuwada)) exitWith {hint localize "STR_ATM_notnumeric"};
  if(_value > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};
  if(_value < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"};
  _gFund = _gfund - _value;
  [_value,0,0] call life_fnc_sewawruk;
  (group player) setVariable ["gangBank",_gFund,true];
  (findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
  closeDialog 0;
  [1,(group player)] remoteExecCall ["life_fnc_gangUpdate",2];
  _message = format ["You've withdrawn $%1 from %2",[_value] call life_fnc_rupadudejat,(group player) getVariable ["gangName","Error"]];
  [_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
  group player setVariable ["gbank_in_use_by",""];
} else {
  (findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
  closeDialog 0;
  _message = "Unauthorized to withdraw from Gang!";
  [_message,true,[1,0,0,1]] call life_fnc_notificationHandler;
  group player setVariable ["gbank_in_use_by",""];
};
