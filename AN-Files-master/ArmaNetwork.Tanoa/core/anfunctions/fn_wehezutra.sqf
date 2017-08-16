/*
  ArmA.Network
  Rathbone
  Notification Message Six
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
//0.041536
//0.0138453
//0.020689863
_message = param [0,[],[[]]];
_display = uiNamespace getVariable ["ANNotification",displayNull];
_background = _display displayCtrl 2005;
_text = _display displayCtrl 1005;

Message6Active = true;

_text ctrlSetText (_message select 0);
_text ctrlSetTextColor (_message select 2);
_backgroundPosition = ((ctrlPosition _background) select 1);
_textPosition = ((ctrlPosition _text) select 1);

_background ctrlSetPosition
[
  0.041379726 * safezoneW + safezoneX,
  _backgroundPosition
];
_text ctrlSetPosition
[
  0.041379726 * safezoneW + safezoneX,
  _textPosition
];

_background ctrlCommit 0.6;
_text ctrlCommit 0.6;

uiSleep (_message select 1);

/*
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
*/
_background ctrlSetPosition
[
  //-0.000156274 * safezoneW + safezoneX,
  -0.300156274 * safezoneW + safezoneX,
  _backgroundPosition
];
_text ctrlSetPosition
[
  //-0.000156274 * safezoneW + safezoneX,
  -0.300156274 * safezoneW + safezoneX,
  _textPosition
];
_background ctrlCommit 0;
_text ctrlCommit 0;
_text ctrlSetText "";

//uiSleep 1;

[2005,1005] call life_fnc_bruswujup;
_index = NotificationArray find _message;
if(_index isEqualTo -1) then {
  diag_log format ["Couldn't find %1 in Notification Queue",_message];
} else {
  NotificationArray deleteAt _index;
};
Message6Active = false;
[] call life_fnc_yapaphest;
