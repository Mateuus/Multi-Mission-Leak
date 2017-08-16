/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private "_totalProducts";
_vendor = param[0,objNull,[objNull]];
_config = param[3,"",[""]];
if(player distance (position _vendor) > 10) exitWith {};
if(player != vehicle player) exitWith {};
if(dialog) exitWith {};
if(life_action_inUse) exitWith {};
if(life_is_processing) exitWith {};
if(_config isEqualTo "") exitWith {};
ProcessInfo = nil;
_configClass = missionConfigFile >> "CfgProcess" >> _config;
if(!isClass _configClass) exitWith {hintSilent "ConfigClass doesn't exist";};
_hasLicense = false;
_licenseName = "";
_licensePrice = 0;
_licenseRequired = getText(_configClass >> "license");
if(_licenseRequired isEqualTo "") then {
	_hasLicense = true;
	_licenseName = "No Training Required";
} else {
	_hasLicense = [_licenseRequired,"bool"] call life_fnc_licenseFind;
	_licensePrice = getNumber (missionConfigFile >> "Licenses" >> _licenseRequired >> "price");
	_licenseName = localize getText(missionConfigFile >> "Licenses" >> _licenseRequired >> "displayName");
};
createDialog "processmenu";
disableSerialization;
_display = findDisplay 72341;
_message = _display displayCtrl 1100;
_message1 = _display displayCtrl 1101;
_message2 = _display displayCtrl 1102;
_processButton = _display displayCtrl 2400;
_message11 = "";
_message111 = "";
_neededArray = [];
{
	private _neededItem = configName _x;
	private _neededAmount = getNumber(_x >> "amount");
	if(_neededAmount <= 0) exitWith {};
	if(!isClass (missionConfigFile >> "VirtualItems" >> configName(_x))) exitWith {};
	private _playerHas = [AN_Inventory,_neededItem,0] call life_fnc_arrayGetValue;
	private _displayName = localize getText (missionConfigFile >> "VirtualItems" >> _neededItem >> "displayName");
	if(_playerHas < _neededAmount) then {
		_message11 = _message11 + format["<t color='#C90600' align='center'>%1</t><br/>",_displayName];
		_processButton ctrlEnable false;
	} else {
		_message11 = _message11 + format["<t color='#1AB000' align='center'>%1</t><br/>",_displayName];
	};

	if(isNil "_totalProducts") then {
		_totalProducts = (_playerHas / _neededAmount);
	} else {
		_totalProducts = (_playerHas / _neededAmount) min _totalProducts;
	};
	_neededArray pushBack [_neededItem, _neededAmount];
} forEach ("true" configClasses (_configClass >> "before"));
_message1 ctrlSetStructuredText parseText _message11;
if(_hasLicense) then {
  _message ctrlSetStructuredText parseText format["<t color='#1AB000' align='center'>%1</t>",_licenseName];
} else {
  _message ctrlSetStructuredText parseText format["<t color='#C90600' align='center'>%1 - Cost: $%2</t>",_licenseName,_licensePrice];
};
{
	_receivingItem = configName _x;
	if(!isClass (missionConfigFile >> "VirtualItems" >> configName(_x))) exitWith {};
  _displayName = localize getText (missionConfigFile >> "VirtualItems" >> _receivingItem >> "displayName");
  _message111 = _message111 + format["<t color='#1AB000' align='center'>%1</t><br/>",_displayName];
} forEach ("true" configClasses (_configClass >> "after"));
_message2 ctrlSetStructuredText parseText _message111;
if(isNil "ProcessInfo") then {
	ProcessInfo = [_config,_licenseRequired,_hasLicense,_neededArray,_totalProducts,_vendor];
};
_processButton buttonSetAction "closeDialog 0; [] spawn life_fnc_baxezudrepewr";
