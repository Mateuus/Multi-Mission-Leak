/*
	File: fuel_prices.sqf
	Author: Paradox
	
	Description: Okay Google , sag mir die Preise
*/

disableSerialization;

4 cutRsc ["tanke", "PLAIN", 1, false];

_ui = uiNameSpace getVariable "life_tanke";
_diesel = _ui displayCtrl 4201;
_superplus = _ui displayCtrl 4202;
_super = _ui displayCtrl 4203;
_kerosin = _ui displayCtrl 4204;

_diesel ctrlSetText format["%1€",fuel_diesel];
_superplus ctrlSetText format["%1€",fuel_super_plus];
_super ctrlSetText format["%1€",fuel_super];
_kerosin ctrlSetText format["%1€",fuel_kerosin];