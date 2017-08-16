/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"
#define SELF GTA_DisplayDepositBox_script

params ["_mode", "_params"];
switch _mode do {
  case "onLoad": {
    _params params ["_display"];

    private _ctrlHeaders = _display displayCtrl IDC_DISPLAYDEPOSITBOX_LISTHEADERS;
    _ctrlHeaders ctrlEnable false;

    private _ctrlButtonClaim = _display displayCtrl IDC_DISPLAYDEPOSITBOX_BUTTONCLAIM;
    _ctrlButtonClaim ctrlEnable false;
    _ctrlButtonClaim ctrlAddEventHandler ["ButtonClick", {["onClickClaim", _this] call SELF}];

    private _ctrlListItems = _display displayCtrl IDC_DISPLAYDEPOSITBOX_LISTITEMS;
    _ctrlListItems ctrlAddEventHandler ["LBSelChanged", {["onSelectDeposit", _this] call SELF}];

    //--- Wait progress
    private _ctrlProgressData = _display displayCtrl IDC_DISPLAYDEPOSITBOX_PROGRESSDATA;
    ["wait", [_ctrlProgressData]] spawn GTA_DisplayDepositBox_script;

    //--- Request data
    GTA_DisplayDepositBox_dataReceived = [missionNamespace, "onDepositBoxDataReceived", {["onDepositBoxDataReceived", [_this]] call SELF}] call BIS_fnc_addScriptedEventHandler;
    [player, getPlayerUID player] remoteExec ["GTA_db_fnc_requestDeposits", 2];
  };

  case "onUnload": {
    //--- Remove data received event handler
    [missionNamespace, "onDepositBoxDataReceived", GTA_DisplayDepositBox_dataReceived] call BIS_fnc_removeScriptedEventHandler
  };

  case "onDepositBoxDataReceived": {
    disableSerialization;
    _params params ["_deposits"];
    private _display = ["GTA_DisplayDepositBox"] call GTA_fnc_getDisplay;
    private _ctrlTextStatus = _display displayCtrl IDC_DISPLAYDEPOSITBOX_TEXTSTATUS;
    private _ctrlProgressData = _display displayCtrl IDC_DISPLAYDEPOSITBOX_PROGRESSDATA;
    private _ctrlListItems = _display displayCtrl IDC_DISPLAYDEPOSITBOX_LISTITEMS;

    //--- Hide the progress bar
    _ctrlProgressData ctrlShow false;

    //--- Handle data
    if (count _deposits > 0) then {
      //--- Hide the status text control
      _ctrlTextStatus ctrlShow false;

      //--- Add deposits to list
      {
        private _index = _ctrlListItems lnbAddRow [format ["£%1", [_x select 1] call life_fnc_numberText], _x select 2];
        _ctrlListItems lnbSetData [[_index, 0], str _x];
      } forEach _deposits;
    } else {
      _ctrlTextStatus ctrlSetText "No deposits to display";
    };
  };

  case "onSelectDeposit": {
    _params params ["_ctrl", "_index"];
    private _display = ctrlParent _ctrl;
    private _ctrlButtonClaim = _display displayCtrl IDC_DISPLAYDEPOSITBOX_BUTTONCLAIM;

    //--- Disable claim button if nothing is selected
    _ctrlButtonClaim ctrlEnable (_index >= 0);
  };

  case "onClickClaim": {
    _params params ["_ctrl"];
    private _display = ctrlParent _ctrl;
    private _ctrlTextStatus = _display displayCtrl IDC_DISPLAYDEPOSITBOX_TEXTSTATUS;
    private _ctrlListItems = _display displayCtrl IDC_DISPLAYDEPOSITBOX_LISTITEMS;
    private _index = lnbCurSelRow _ctrlListItems;

    //--- Claim data
    private _deposit = _ctrlListItems lnbData [_index, 0];
    _deposit = call compile _deposit;

    //--- Explode deposit data
    _deposit params ["_id", "_amount", "_note"];

    //--- Error checks
    if (isNil "_id" || {isNil "_amount"} || {isNil "_note"}) exitWith {hint "Unable to claim deposit"};

    //--- Delete the deposit from the database
    [_id, getPlayerUID player] remoteExec ["GTA_db_fnc_claimDeposit", 2];

    //--- Add money
    GTA_money_bank = GTA_money_bank + _amount;
    [1] call GTA_fnc_updatePlayerPartial;

    //--- Delete the row
    _ctrlListItems lnbDeleteRow _index;

    //--- Nothing to display
    if (lnbSize _ctrlListItems select 0 <= 0) then {
      _ctrlTextStatus ctrlSetText "No deposits to display";
      _ctrlTextStatus ctrlShow true;
    } else {
      //--- Select next row
      if (lnbCurSelRow _ctrlListItems == -1) then {
        _ctrlListItems lnbSetCurSelRow ([lnbSize _index - 1, _index] select (_index > lnbSize _index - 1));
      };
    };
  };

  case "wait": {
    disableSerialization;
    _params params ["_ctrlProgressData"];

    waitUntil {
      _ctrlProgressData progressSetPosition (diag_frameNo % 100 / 100);
      isNull _ctrlProgressData || {!ctrlShown _ctrlProgressData}
    };
  };
};
