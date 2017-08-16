/*
	Script file made by: Maximum
	Idea based off: Liemans script - did way to much to achieve the same thing.
	Description: Lets a officer request backup VIA Y menu button
*/
params [
	["_player",objNull,[objNull]],
	["_deleteTime",60,[0]]
];

if(isNull _player) exitWith {};
if(playerSide != west) exitWith {};
_backupmsg = createMarkerLocal [("_backupmsg" + (_player getVariable["realname",name _player])), getPos _player];
_backupmsg setMarkerTypeLocal "mil_warning";
_backupmsg setMarkerColorLocal "colorRed";
_backupmsg setMarkerTextLocal format ["%1 Is Requesting backup here", _player getVariable["realname",name _player]];
uiSleep _deleteTime;
deleteMarkerLocal _backupmsg;
