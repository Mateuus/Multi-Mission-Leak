/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (GTA_actionLock) exitWith {};
if (vehicle player != player) exitWith {};

private ["_type", "_cfg", "_materials", "_products", "_license", "_actionTime", "_outputCount", "_outputMessage"];
_type = [_this, 0, "", [""]] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgProcessing" >> _type;

//--- Error checks
if (!isClass _cfg) exitWith {};

//--- Configuration
_materials = getArray (_cfg >> "materials");
_products = getArray (_cfg >> "products");

//--- Exit if no products or materials
if (count _materials == 0) exitWith {};
if (count _products == 0) exitWith {};

//--- Check processing license
_license = getText (_cfg >> "license");
if (_license != "" && {!([_license] call GTA_fnc_hasLicense)}) exitWith {
  //--- No license hint
  [1, ["STR_GTA_PROCESSING_NOLICENSE", [([_license, 0] call life_fnc_licenseType) select 0] call life_fnc_varToStr], ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
};

//--- Check if player has the required materials
if !([_materials] call GTA_fnc_hasProcessingMats) exitWith {
  private "_message";
  _message = "";

  {
    private ["_var", "_str"];
    _var = [_x select 0, 0] call life_fnc_varHandle;
    _str = [_var] call life_fnc_varToStr;

    _message = _message + format ["%1x %2<br />", _x select 1, _str];
  } forEach _materials;

  //--- No materials hint
  [1, ["STR_GTA_PROCESSING_NOMATS", _message], ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
};

//--- Processing time
_actionTime = getNumber (_cfg >> "actionTime");

//--- Perks
_actionTime = if (
  //--- Check if any product is illegal
  {
    if !([_x select 0] call GTA_fnc_isVirtualItemLegal) exitWith {false};
    true
  } forEach _products
) then {
  //--- Working Man perk
  switch ("working_man" call GTA_fnc_perkRank) do {
    case 1: {_actionTime * 0.9};
    case 2: {_actionTime * 0.8};
    case 3: {_actionTime * 0.7};
    default {_actionTime};
  };
} else {
  //--- Heisenberg perk
  switch ("heisenberg" call GTA_fnc_perkRank) do {
    case 1: {_actionTime * 0.9};
    case 2: {_actionTime * 0.8};
    case 3: {_actionTime * 0.7};
    default {_actionTime};
  };
};

//--- Process action
if ([_actionTime, "Processing"] call GTA_fnc_action) then {
  _outputCount = 0;

  //--- Process
  while {true} do {
    private "_exit";
    _exit = false;

    //--- Check if player has the required materials
    if !([_materials] call GTA_fnc_hasProcessingMats) exitWith {};

    //--- Remove materials
    {
      [false, _x select 0, _x select 1] call life_fnc_handleInv;
    } forEach _materials;

    //--- Give products
    {
      [true, _x select 0, _x select 1] call life_fnc_handleInv;
    } forEach _products;

    //--- Increment
    _outputCount = _outputCount + 1;
  };

  if (_outputCount > 0) then {
    //--- Compile output item list message
    _outputMessage = "";

    {
      private ["_var", "_str"];
      _var = [_x select 0, 0] call life_fnc_varHandle;
      _str = [_var] call life_fnc_varToStr;

      //--- Add item name to message
      _outputMessage = format ["%1%2x %3", _outputMessage, (_x select 1) * _outputCount, _str];

      //--- Add comma for all but last item
      if (count _products > 1 && {_forEachIndex != count _products - 1}) then {
        _outputMessage = _outputMessage + ", ";
      };
    } forEach _products;

    //--- Message
    systemChat format [localize "STR_GTA_PROCESSING_PROCESSED", _outputMessage];

    //--- Add experience
    ["process", "Processing", _outputCount] call GTA_fnc_addExp;
  };
} else {
	titleText ["Processing interrupted", "PLAIN"];
};
