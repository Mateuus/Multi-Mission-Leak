/*
  ArmA.Network
  Rathbone
  Gives Targeted Player Money
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(isNull life_pInact_curTarget OR {isNil "life_pInact_curTarget"} OR {!alive life_pInact_curTarget}) exitWith {};
if(player distance life_pInact_curTarget > 5) exitWith {hintSilent "Too far away to give the items"; closeDialog 0;};
disableSerialization;
_display = findDisplay 57633;
_amount = parseNumber(ctrlText 1400);
if(an_cash < _amount) exitWith {hintSilent "You do not have that amount to hand over!";};
if(_amount <= 0 OR {_amount > 100000}) exitWith {hintSilent "You cannot give more than $100,000 at once";};
if(!([str(_amount)] call life_fnc_spunetuwada)) exitWith {hintSilent "You didn't enter an actual number format.";};
closeDialog 0;
[_amount,0,1] call life_fnc_sewawruk;
[life_pInact_curTarget,_amount,player] remoteExecCall ["life_fnc_quthuvawruf",life_pInact_curTarget];
_message = format["You've handed over $%1",[_amount] call life_fnc_rupadudejat];
[_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
