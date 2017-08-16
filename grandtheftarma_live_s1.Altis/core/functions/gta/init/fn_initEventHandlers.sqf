/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- TODO: Vanilla Life
player addEventHandler ["Take", {_this call life_fnc_onTakeItem}];
player addEventHandler ["Fired", {_this spawn life_fnc_onFired}];

//--- Player events
player addEventHandler ["Fired", GTA_fnc_onFired];
player addEventHandler ["FiredNear", GTA_fnc_onFiredNear];
player addEventHandler ["HandleDamage", GTA_fnc_onHandleDamage];
//player addEventHandler ["HandleHeal", {_this spawn GTA_fnc_onHandleHeal; false}];
player addEventHandler ["InventoryClosed", {_this call GTA_fnc_onInventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call GTA_fnc_onInventoryOpened}];
player addEventHandler ["Killed", GTA_fnc_onKilled];
player addEventHandler ["Put", GTA_fnc_onPut];
player addEventHandler ["Take", GTA_fnc_onTake];
player addEventHandler ["WeaponAssembled", GTA_fnc_onWeaponAssembled];
player addEventHandler ["WeaponDisassembled", GTA_fnc_onWeaponDisassembled];

//--- Key events
findDisplay 46 displayAddEventHandler ["KeyDown", {_this call GTA_fnc_onKeyDown}];
findDisplay 46 displayAddEventHandler ["KeyUp", {_this call GTA_fnc_onKeyUp}];

//--- Action events
inGameUISetEventHandler ["Action", "_this call GTA_fnc_onAction"];
inGameUISetEventHandler ["NextAction", "_this call GTA_fnc_onNextAction"];
inGameUISetEventHandler ["PrevAction", "_this call GTA_fnc_onPrevAction"];

//--- Map marker placed
findDisplay 12 displayAddEventHandler ["ChildDestroyed", {
  params ["_display", "_childDisplay", "_exitCode"];

  //--- Check if IDD matches RscDisplayInsertMarker and the display exited with "OK"
  if (ctrlIDD _childDisplay == 54 && {_exitCode == 1}) then {
    private _ctrlMarkerChannel = _display displayCtrl 103;

    //--- Register all markers before a new one is placed
    _allMarkers = allMapMarkers;

    //--- Spawn a scheduled thread
    [_allMarkers, parseNumber (_ctrlMarkerChannel lbData lbCurSel _ctrlMarkerChannel)] spawn {
      params ["_allMarkers", "_channel"];
      //--- Remove all previous markers from the allMapMarkers array to determine the new marker name
      _marker = allMapMarkers - _allMarkers select 0;

      //--- Determine remote exec target
      private _target = switch _channel do {
        case 1: {playerSide};
        case 3: {group player};
        case 4: {crew vehicle player};
        default {0};
      };

      //--- Add prefix to clients
      [_marker, profileName] remoteExec ["GTA_fnc_prefixUserMarker", _target];
    };
  };
}];

//--- Remove insert map marker channel options
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["MouseButtonDblClick", {
  //--- Spawn an scheduled thread
  0 = [] spawn {
    disableSerialization;
    private _display = findDisplay 54;

    //--- Check if display exists
    if (!isNull _display) then {
      private _ctrlMarkerChannel = _display displayCtrl 103;

      //--- Add direct channel marker option
      private _lbItem = _ctrlMarkerChannel lbAdd "Direct Channel";
      _ctrlMarkerChannel lbSetData [_lbItem, "5"];

      //--- Remove option if channel is not enabled
      private _indexOffset = 0;
      for "_i" from 0 to 5 do {
        if (!channelEnabled _i) then {
          _ctrlMarkerChannel lbDelete (_i - _indexOffset);
          _indexOffset = _indexOffset + 1;
        };
      };

      //--- Reset current selection
      _ctrlMarkerChannel lbSetCurSel 0;
    };
  };
}];
