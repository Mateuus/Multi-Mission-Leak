/*
	File: fn_backupCall.sqf
*/
_player = [_this,0,objnull,[objnull]] call bis_fnc_param;
_deleteTime = [_this,1,60,[0]] call bis_fnc_param;
if(isNull _player) exitWith {};
if(playerSide != west) exitWith {};
_backupmsg = createMarkerLocal [("_backupmsg" + (_player getVariable["realname",name _player])), getPos _player];
_backupmsg setMarkerTypeLocal "mil_warning";
_backupmsg setMarkerColorLocal "colorRed";
_backupmsg setMarkerTextLocal format ["%1 is requesting backup here!", _player getVariable["realname",name _player]];
[1,format["%1 is in need of backup!",name _player]] remoteExecCall ["life_fnc_broadcast",west];
uiSleep _deleteTime;
deleteMarkerLocal _backupmsg;
