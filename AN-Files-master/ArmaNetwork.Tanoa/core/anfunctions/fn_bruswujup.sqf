/*
  ArmA.Network
  Rathbone
  Resets Specific Notification for next use
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private [];
disableSerialization;
_backgroundCase = param [0,-1,[0]];
_textCase = param [1,-1,[0]];
_display = uiNamespace getVariable ["ANNotification",displayNull];
_background = _display displayCtrl _backgroundCase;
_text = _display displayCtrl _textCase;
_backgroundPosition = ((ctrlPosition _background) select 1);
_textPosition = ((ctrlPosition _text) select 1);

_background ctrlSetPosition
[
  -0.000156274 * safezoneW + safezoneX,
  _backgroundPosition
];
_text ctrlSetPosition
[
  -0.000156274 * safezoneW + safezoneX,
  _textPosition
];

_background ctrlCommit 0;
_text ctrlCommit 0;
