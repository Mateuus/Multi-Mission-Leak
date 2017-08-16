/*
  ArmA.Network
  Rathbone
  Withdraw money from Government Funds
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(life_govCash isEqualTo -1) exitWith {hintSilent "Goverment Funds aren't ready to be withdrawn!";};
disableSerialization;
_value = parseNumber(ctrlText 1401);
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value <= 0) exitWith {};
if(!([str(_value)] call life_fnc_spunetuwada)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_govCash) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_value < 100 && {life_govCash > 20000000}) exitWith {hint localize "STR_ATM_WithdrawMin"};
[_number,1,0] call life_fnc_sewawruk;
(findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
closeDialog 0;
life_govCash = life_govCash - _number;
[0,format ["%1 have been withdrawn from Government Funds",_number]] remoteExecCall ["life_fnc_brusathusek",-2];
[0,life_govCash] remoteExecCall ["life_fnc_updateGovDetails",2];
