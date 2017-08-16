/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
createDialog "civ_govmenu";
_dialog = findDisplay 50700;
_presidentName = _dialog displayCtrl 2403;
_inOffice = _dialog displayCtrl 2404;
_tax = _dialog displayCtrl 2406;
_lawList = _dialog displayCtrl 1500;
_electionDay = _dialog displayCtrl 2405;
_lawArray = [];
_presidentName ctrlSetStructuredText parseText format["%1",(life_gov select 1)];
_isInOffice = [(life_gov select 0)] call life_fnc_steguzachap;
if(_isInOffice) then {
  _inOffice ctrlSetStructuredText parseText format["Yes"];
} else {
  _inOffice ctrlSetStructuredText parseText format["No"];
};

if((life_gov select 0) isEqualTo 0) then {
    _tax ctrlSetStructuredText parseText format["0%"];
} else {
    _tax ctrlSetStructuredText parseText format["%1%",([(life_gov select 2)/100] call life_fnc_rupadudejat)];
};

_electionDay ctrlSetStructuredText parseText format["%1 Days",(life_gov select 10)];

if(life_gov select 3) then {
  _lawList lbAdd "Free Healthcare - Medical Checks at Hospitals/Clinics are free";
  _lawArray pushBack true;
};
if(life_gov select 4) then {
  _lawList lbAdd "Marijuana is Legal";
  _lawArray pushBack true;
};
if(life_gov select 5) then {
  _lawList lbAdd "Increased Paycheck for Citizens - 20% increase in Paychecks";
  _lawArray pushBack true;
};
if(life_gov select 6) then {
  _lawList lbAdd "The death penalty is sanctioned by the Government";
  _lawArray pushBack true;
};
if(life_gov select 7) then {
  _lawList lbAdd "Free necessities provided by the Government (Water,Food)";
  _lawArray pushBack true;
};
if(life_gov select 8) then {
  _lawList lbAdd "Lower Bank Taxes - 5% decrease in taxes";
  _lawArray pushBack true;
};

if((count _lawArray) isEqualTo 0) then {
  _lawList lbAdd "No active laws to show";
  _lawList lbSetCurSel -1;
  _lawList ctrlEnable false;
} else {
  _lawList lbSetCurSel 0;
  _lawList ctrlEnable true;
};
