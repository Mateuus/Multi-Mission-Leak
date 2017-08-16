////////////////////////////////////////////////////////
// ArmA.Network
// Shix (Bobby Jones)
//Params [Duration,type "message"/"notification", readout sound (true false), notification sound(true/false), "message content"]
////////////////////////////////////////////////////////
//I don't even comment my code bro

waitUntil {AN_CurNotificationCount == 0};
disableSerialization;

_duration = _this select 0;
_type = _this select 1;
_readOutSound = _this select 2;
_notificationSound = _this select 3;
_content = [_this, 4, "", [""]] call BIS_fnc_param;

cutRsc ["ANnotification", "PLAIN", 0, true];
_display = uiNamespace GetVariable ['ANnotification', _this select 0];
AN_CurNotificationCount = 1;

_ctrl = (_display displayCtrl 1100);
_ctrlBG = (_display displayCtrl 1200);
_ctrlBG ctrlSetPosition [_BGCurPos,-0.5,0.63,1];
_ctrlBG ctrlCommit 0;

if(_type == "message")then{
  _ctrlBG ctrlSetText "\sndimg\textures\Message_Box.paa"
};

if(_type == "notification")then{
  _ctrlBG ctrlSetText "\sndimg\textures\Notification_Box.paa"
};

_BGCurPos = 1.65;
_BGEndPos = 1.17;
_BGFinishPos = 1.65;

if(_notificationSound)then{
  playSound "Notification";
};

while {_BGCurPos > _BGEndPos} do {
    _BGCurPos = _BGCurPos - 0.01;
    _ctrlBG = (_display displayCtrl 1200);
    _ctrlBG ctrlSetPosition [_BGCurPos,-0.5,0.63,1];
    _ctrlBG ctrlCommit 0;
    uisleep 0.01;
};

for "_i" from 1 to (count _content) do
{
  _ctrl ctrlSetText (_content select [0, _i]);
  if(_readOutSound)then
  {
    playSound"ReadOutClick";
  };
  uiSleep 0.05;
};

uiSleep _duration;
_ctrl ctrlSetText "";

while {_BGCurPos < _BGFinishPos} do {
  _BGCurPos = _BGCurPos + 0.01;
  _ctrlBG ctrlSetPosition [_BGCurPos,-0.5,0.63,1];
  _ctrlBG ctrlCommit 0;
  uisleep 0.01;
};
AN_CurNotificationCount = 0;
