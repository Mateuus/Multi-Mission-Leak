/*
    File: fn_backupCall.sqf
    Author: Skrow & Skyfezzer
    Description:
*/
_player = [_this,0,objnull,[objnull]] call bis_fnc_param;
_deleteTime = [_this,1,60,[0]] call bis_fnc_param;
if(isNull _player) exitWith {};
if(playerSide != west) exitWith {};
hint localize "STR_Item_backup";
_backupmsg = createMarkerLocal [("_backupmsg" + name _player), getPos _player];
_backupmsg setMarkerTypeLocal "mil_warning";
_backupmsg setMarkerColorLocal "colorRed";
_backupmsg setMarkerTextLocal format ["%1 a besoin de renfort ici",name _player];
sleep _deleteTime;
deleteMarkerLocal _backupmsg;
