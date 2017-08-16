/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"

private [ "_mode", "_params" ];
_mode = _this select 0;
_params = _this select 1;

switch _mode do {
  case "onLoad": {
    //--- Display
    _display = _params select 0;

    //--- Control MapRadar
    _ctrlPictureStatus = _display displayCtrl IDC_RSCSOUNDSTATUS_PICTURESTATUS;
    _ctrlPictureStatus ctrlShow ( soundVolume == 0.2 );

    //--- Refresh layer
    GTA_RscSoundStatus_refreshHandle = [ _display ] spawn {
      disableSerialization;

      //--- Display
      _display = _this select 0;

      //--- Wait for layer to be destroyed
      waitUntil { isNull _display	};

      //--- Create new layer
      [ "GTA_RscSoundStatus" ] call GTA_fnc_createRscLayer;
    };
  };

  case "onUnload": {
  };

  case "onToggleSound": {
    _display = uiNamespace getVariable ["GTA_RscSoundStatus", displayNull];
    _ctrlPictureStatus = _display displayCtrl IDC_RSCSOUNDSTATUS_PICTURESTATUS;
    _muted = _params select 0;

    _ctrlPictureStatus ctrlShow _muted;
  };
};
