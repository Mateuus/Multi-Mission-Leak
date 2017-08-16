/*
	ArmA.Network
	Rathbone
	Updates Laws set by President
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if(life_gov select 9) exitWith {hintSilent "You can only toggle a specific Law each server restart once!";};
_lawIndex = _this select 0;
_lawCost = _this select 1;
_dialog = findDisplay 50400;
_text = _dialog displayCtrl (3000 + _lawIndex);
_lawSelect = life_gov select _lawIndex;

if(_lawSelect) then {
  _text ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
  [_lawIndex,0] remoteExecCall ["life_fnc_updateLaws",2];
} else {
  if(life_govCash < _lawCost) exitWith {hintSilent "The Government doesn't have enough to fund this law!";};
  _text ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
  life_govCash = life_govCash - _lawCost;
  [_lawIndex,1,life_govCash] remoteExecCall ["life_fnc_updateLaws",2];
};
