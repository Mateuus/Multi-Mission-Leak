/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"
#define SELF GTA_DisplayResourceIndex_script

params ["_mode", "_params"];
switch _mode do {
  case "onLoad": {
    _params params ["_display"];

    private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_EDITSEARCH;
    _ctrlEditSearch ctrlAddEventHandler ["KeyUp", {["onSearch", _this] call SELF}];

    private _ctrlButtonSearch = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_BUTTONSEARCH;
    _ctrlButtonSearch ctrlAddEventHandler ["ButtonClick", {["onSearchClicked", _this] call SELF}];

    //--- Filter
    private _ctrlFilter = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_FILTER;
    private _ctrlListItems = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_LISTITEMS;
    [_ctrlFilter, _ctrlListItems] call BIS_fnc_initListNBoxSorting;

    ["refresh", [_display]] call SELF;
  };

  case "onUnload": {

  };

  case "onSearch": {
    private _display = ctrlParent (_params select 0);
    private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_EDITSEARCH;
    private _ctrlButtonSearch = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_BUTTONSEARCH;

    _ctrlButtonSearch ctrlSetText (["\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa", "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa"] select (ctrlText _ctrlEditSearch == ""));
    ["refresh", [_display]] call SELF;
  };

  case "onSearchClicked": {
    private _display = ctrlParent (_params select 0);
    private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_EDITSEARCH;

    if (ctrlText _ctrlEditSearch != "") then {
      _ctrlEditSearch ctrlSetText "";
    };

    ["onSearch", _params] call SELF;
  };

  case "refresh": {
    private _display = _params select 0;
    private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_EDITSEARCH;
    private _ctrlFilter = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_FILTER;
    private _ctrlListItems = _display displayCtrl IDC_DISPLAYRESOURCEINDEX_LISTITEMS;
    private _sell = ["sell_array"] call GTA_fnc_getConstant;

    lnbClear _ctrlListItems;
    {
      private _item = _x;
      private _var = [_item, 0] call life_fnc_varHandle;
      private _name = [_var] call life_fnc_varToStr;

      if (toLower _name find (toLower ctrlText _ctrlEditSearch) >= 0) then {
        private _weight = [_item] call life_fnc_itemWeight;
        private _sellIndex = [_sell, _item] call GTA_fnc_nestedIndex;
        private _value = if (_sellIndex == -1) then {
          0
        } else {
          _sell select _sellIndex select 1
        };

        //--- Push the list item
        private _lnbIndex = _ctrlListItems lnbAddRow [_name, str _weight, format ["£%1", [_value] call life_fnc_numberText]];
        _ctrlListItems lnbSetValue [[_lnbIndex, 1], _weight];
        _ctrlListItems lnbSetValue [[_lnbIndex, 2], _value];
      };
    } forEach [
      "apple",
      "bottledbeer",
      "bottledshine",
      "bottledwhiskey",
      "catshark",
      "rock",
      "cement",
      "cmeth_u_1",
      "cmeth_u_2",
      "cmeth_u_3",
      "cmeth_p",
      "cocaine_u",
      "cocaine_p",
      "copper_u",
      "copper_p",
      "diamond_u",
      "diamond_p",
      "sand",
      "glass",
      "heroin_u",
      "heroin_p",
      "iron_u",
      "iron_p",
      "mackerel",
      "marijuana",
      "moneybag",
      "mullet",
      "oil_u",
      "oil_p",
      "ornate",
      "peach",
      "wood_u",
      "wood_p",
      "naturalgas",
      "propane",
      "rice_u",
      "rice_p",
      "salema",
      "salt_u",
      "salt_p",
      "silver_u",
      "silver_p",
      "sugar_u",
      "sugar_p",
      "tuna",
      "turtle",
      "watermelon"
    ];

    //--- Force sorting
    _ctrlFilter lnbSetCurSelRow -1;
  };
};
