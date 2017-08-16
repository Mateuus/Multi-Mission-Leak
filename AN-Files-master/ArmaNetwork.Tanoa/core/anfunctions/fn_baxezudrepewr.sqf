/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
scopeName "processing";
_configFile = ProcessInfo select 0;
_licenseRequired = ProcessInfo select 1;
_hasLicense = ProcessInfo select 2;
_neededArray = ProcessInfo select 3;
_totalProducts = ProcessInfo select 4;
_vendor = ProcessInfo select 5;
ProcessInfo = nil;
_licenseName = "";
_licensePrice = 0;
if(!_hasLicense) then {
	_licensePrice = getNumber(missionConfigFile >> "Licenses" >> _licenseRequired >> "price");
	_licenseName = localize getText(missionConfigFile >> "Licenses" >> _licenseRequired >> "displayName");
	_action =
	[
		parseText format["To process this item you require %1. Would you like to buy this license for $%2?",_licenseName,[_licensePrice] call life_fnc_rupadudejat],
		"Buy License",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action) exitWith {breakOut "processing";};
	if(an_cash < _licensePrice) exitWith {hintSilent "Not Enough Cash"; breakOut "processing";};
	[_licensePrice,0,1] call life_fnc_sewawruk;
	[_licenseRequired] call life_fnc_licenseAdd;
	[2] call life_fnc_maphuwres;
};

_levelRequired = getNumber (missionConfigFile >> "CfgProcess" >> _configFile >> "level");
if(_levelRequired > life_level) exitWith {hintSilent "";breakOut "processing";};

_expReceived = getNumber (missionConfigFile >> "CfgProcess" >> _configFile >> "exp");
_capturePoint = getNumber (missionConfigFile >> "CfgProcess" >> _configFile >> "capture");
_captureYeahorNah = if(_capturePoint > 0) then {true} else {false};

_toSelect = if(_captureYeahorNah) then {life_capture_list select (_capturePoint - 1)} else {nil};
if(_captureYeahorNah) then {
	if((_toSelect select 2) isEqualTo 1) then {
		if(!((_toSelect select 0) isEqualTo (group player getVariable["gangName",""]))) then {
			_tax = 2;
		};
	};
};
_gang = false;
_expTime = if("processing" in AN_Skills) then {15} else {0};
life_is_processing = true;
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText "Processing Item...";
_progressTime = (45 - _expTime) / (1 / 0.006);
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do
{
	_progress progressSetPosition _i;
	sleep _progressTime;
	if (!alive player) exitWith
	{
		life_is_processing = false;
		[false] call life_fnc_tufruxatra;
		breakOut "processing";
	};
	if (player != vehicle player) exitWith
	{
		life_is_processing = false;
		[false] call life_fnc_tufruxatra;
		breakOut "processing";
	};
	if (player distance (position _vendor) > 10) exitWith
	{
		life_is_processing = false;
		[false] call life_fnc_tufruxatra;
		breakOut "processing";
	};
	if (life_istazed) exitWith
	{
		life_is_processing = false;
		[false] call life_fnc_tufruxatra;
		breakOut "processing";
	};
	if (player getVariable ["restrained",false]) exitWith
	{
		life_is_processing = false;
		[false] call life_fnc_tufruxatra;
		breakOut "processing";
	};
};
[false] call life_fnc_tufruxatra;
{
	_item = _x select 0;
	_amount = _x select 1;
	_inventoryAmount = missionNamespace getVariable [format ["%1",_item],0];
	_itemRemove = _amount * _totalProducts;
	[_item,_itemRemove] call life_fnc_virtualItemRemove;
} forEach _neededArray;
{
	_item = configName _x;
	if(!isClass (missionConfigFile >> "VirtualItems" >> _item)) exitWith {life_is_processing = false;breakOut "processing";};
	_amount = getNumber(_x >> "amount");
  if(_totalProducts > 1) then {
    if(_captureYeahorNah) then {
  		if((_toSelect select 2) isEqualTo 1) then {
  			if((_toSelect select 0) isEqualTo (group player getVariable["gangName",""])) then {
          _gang = false;
  			} else {
          _totalProducts = floor(_totalProducts * 0.75);
          _gang = true;
  			};
  		};
  	};
  };
	_itemsToAdd = _amount * _totalProducts;
	[_item,_itemsToAdd] call life_fnc_virtualItemAdd;
} forEach ("true" configClasses (missionConfigFile >> "CfgProcess" >> _configFile >> "after"));

if(_gang) then {
  hintSilent format["You retain 75 percent of the product after the owners of %1 took a 25 percent cut!",_toSelect select 0];
} else {
  hintSilent format["You've finished processing!",(group player) getVariable["gangName",""]];
};
_exp = round(random(_expReceived));
_exp = _totalProducts * _exp;
[true,_exp] call life_fnc_thagayazapu;
life_is_processing = false;
