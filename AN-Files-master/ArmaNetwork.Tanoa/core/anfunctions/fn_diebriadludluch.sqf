/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_crimes = ctrlText 1400;
if(_crimes isEqualTo "") exitWith {hintSilent "You must enter your crimes!";};
if([":",_crimes] call BIS_fnc_inString) exitWith {hintSilent "A bad character was found"};
_len = [_crimes] call KRON_StrLen;
if(_len > 150) exitWith {hintSilent "The maximum character limit for a message is 150."};

_amount = parseNumber(ctrlText 1401);
if(_amount isEqualTo 0) exitWith {hintSilent "Error.";};
if(!([str(_amount)] call life_fnc_spunetuwada)) exitWith {hintSilent "You didn't enter an actual number format.";};
if(an_bank < _amount) exitWith {hintSilent "You do not have this kind of money!";};
if(_amount > 999999) exitWith {hintSilent "You can't put a fee of more than $999,999";};
[player,_crimes,_amount] remoteExecCall ["life_fnc_requestLawyer",2];
RequestedLawyer = true;
hintSilent "You've requested a Lawyer.";
