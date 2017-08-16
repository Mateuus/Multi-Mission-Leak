/*
	ArmA.Network
	Rathbone
	Opens Laws Menu for President
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if(!life_isGov) exitWith {};
disableSerialization;
createDialog "togglelaw_menu";
_display = findDisplay 50400;

_healthcareD = _display displayCtrl 3003;
_healthcareF = _display displayCtrl 2406;
_marijuanaD = _display displayCtrl 3004;
_marijuanaF = _display displayCtrl 2407;
_payD = _display displayCtrl 3005;
_payF = _display displayCtrl 2408;
_penaltyD = _display displayCtrl 3006;
_penaltyF = _display displayCtrl 2409;
_freeD = _display displayCtrl 3007;
_freeF = _display displayCtrl 2410;
_bankD = _display displayCtrl 3008;
_bankF = _display displayCtrl 2411;

if(life_gov select 3) then {
  _healthcareD ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
} else {
  _healthcareD ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
};
if(life_gov select 4) then {
  _marijuanaD ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
} else {
  _marijuanaD ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
};
if(life_gov select 5) then {
  _payD ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
} else {
  _payD ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
};
if(life_gov select 6) then {
  _penaltyD ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
} else {
  _penaltyD ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
};
if(life_gov select 7) then {
  _freeD ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
} else {
  _freeD ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
};
if(life_gov select 8) then {
  _bankD ctrlSetStructuredText parseText format["<t color='#01D106'>YES</t>"];
} else {
  _bankD ctrlSetStructuredText parseText format["<t color='#E10B00'>NO</t>"];
};

_healthcareF ctrlSetStructuredText parseText format["$500,000"];
_marijuanaF ctrlSetStructuredText parseText format["$100,000"];
_payF ctrlSetStructuredText parseText format["$850,000"];
_penaltyF ctrlSetStructuredText parseText format["$900,000"];
_freeF ctrlSetStructuredText parseText format["$750,000"];
_bankF ctrlSetStructuredText parseText format["$850,000"];
