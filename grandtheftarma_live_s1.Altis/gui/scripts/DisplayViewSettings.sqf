/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"
#define SELF GTA_DisplayViewSettings_script

params ["_mode", "_params"];
switch _mode do {
  case "onLoad": {
    _params params ["_display"];

    //--- Disable view distance loop
    GTA_settings_viewDistance_enable = false;

    //--- Get settings
    GTA_DisplayViewSettings_settings = [
      ["View_Infantry"] call GTA_fnc_getSetting,
      ["View_Ground"] call GTA_fnc_getSetting,
      ["View_Air"] call GTA_fnc_getSetting
    ];

    //--- Store current tab index
    GTA_DisplayViewSettings_tab = 0;

    //--- Tabs
    private _ctrlTabs = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_TABS;
    _ctrlTabs ctrlAddEventHandler ["ToolboxSelChanged", {["onTabChanged", _this] call SELF}];

    //--- Sync checkbox
    private _ctrlCheckSync = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_CHECKSYNC;
    _ctrlCheckSync ctrlAddEventHandler ["CheckedChanged", {["setViewDistance", _this] call SELF}];

    //--- Sliders
    private _ctrlSliderView = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDERVIEW;
    _ctrlSliderView sliderSetRange [500, 12000];
    _ctrlSliderView sliderSetSpeed [100, 100, 100];

    private _ctrlSliderObject = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDEROBJECT;
    _ctrlSliderObject sliderSetSpeed [100, 100, 100];

    private _ctrlSliderShadows = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDERSHADOWS;
    _ctrlSliderShadows sliderSetRange [50, 200];
    _ctrlSliderShadows sliderSetSpeed [2, 2, 1];

    {
      _x ctrlAddEventHandler ["SliderPosChanged", {["setViewDistance", _this] call SELF}];
    } forEach [_ctrlSliderView, _ctrlSliderObject, _ctrlSliderShadows];

    //--- Refresh settings
    ["refreshSettings", [_display]] call SELF;
  };

  case "onUnload": {
    _params params ["_display", "_exitCode"];

    if (_exitCode == 1) then {
      //--- Save settings
      {
        [_x, GTA_DisplayViewSettings_settings select _forEachIndex] call GTA_fnc_setSetting;
      } forEach ["View_Infantry", "View_Ground", "View_Air"];
    };

    //--- Enable and refresh view distance loop
    GTA_settings_viewDistance_lastObject = objNull;
    GTA_settings_viewDistance_enable = true;
  };

  case "onTabChanged": {
    _params params ["_ctrl", "_index"];
    private _display = ctrlParent _ctrl;
    GTA_DisplayViewSettings_tab = _index;

    //--- Refresh settings
    ["refreshSettings", [_display]] call SELF;

    //--- Apply new view distance
    ["applyViewDistance", []] call SELF;
  };

  case "refreshSettings": {
    _params params ["_display"];
    private _checkSync = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_CHECKSYNC;
    private _ctrlSliderView = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDERVIEW;
    private _ctrlSliderObject = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDEROBJECT;
    private _ctrlSliderShadows = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDERSHADOWS;
    private _ctrlEditView = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_EDITVIEW;
    private _ctrlEditObject = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_EDITOBJECT;
    private _ctrlEditShadows = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_EDITSHADOWS;
    private _settings = GTA_DisplayViewSettings_settings select GTA_DisplayViewSettings_tab;

    _settings params ["_viewDistance", "_objectDistance", "_shadowsDistance", "_sync"];
    _checkSync cbSetChecked _sync;
    _ctrlSliderView sliderSetPosition _viewDistance;
    _ctrlEditView ctrlSetText str _viewDistance;
    _ctrlSliderObject sliderSetRange [500, _viewDistance];
    _ctrlSliderObject sliderSetPosition _objectDistance;
    _ctrlEditObject ctrlSetText str _objectDistance;
    _ctrlSliderShadows sliderSetPosition _shadowsDistance;
    _ctrlEditShadows ctrlSetText str _shadowsDistance;
  };

  case "setViewDistance": {
    _params params ["_ctrl"];
    private _display = ctrlParent _ctrl;
    private _ctrlCheckSync = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_CHECKSYNC;
    private _ctrlSliderView = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDERVIEW;
    private _ctrlSliderObject = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDEROBJECT;
    private _ctrlSliderShadows = _display displayCtrl IDC_DISPLAYVIEWSETTINGS_SLIDERSHADOWS;
    private _settings = GTA_DisplayViewSettings_settings select GTA_DisplayViewSettings_tab;

    //--- Clamp object view distance
    if (cbChecked _ctrlCheckSync || {sliderPosition _ctrlSliderView < sliderPosition _ctrlSliderObject}) then {
      //--- Sync view and object distances
      _ctrlSliderObject sliderSetRange [500, sliderPosition _ctrlSliderView];
      _ctrlSliderObject sliderSetPosition sliderPosition _ctrlSliderView;
    };

    //--- Save
    _settings set [0, sliderPosition _ctrlSliderView];
    _settings set [1, sliderPosition _ctrlSliderObject];
    _settings set [2, sliderPosition _ctrlSliderShadows];
    _settings set [3, cbChecked _ctrlCheckSync];

    //--- Refresh settings
    ["refreshSettings", [_display]] call SELF;

    //--- Apply new view distance
    ["applyViewDistance", []] call SELF;
  };

  case "applyViewDistance": {
    private _settings = GTA_DisplayViewSettings_settings select GTA_DisplayViewSettings_tab;

    //--- Apply
    setViewDistance (_settings select 0);
    setObjectViewDistance [_settings select 1, _settings select 2];
  };
};
