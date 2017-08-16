#include <macro.h>
/*
	File: fn_panicButtonMarkers.sqf
	Author: blaster
	
	Description:
	Creates Makers for cops when panic button is pushed.
*/
private["_pos","_name"];
_pos = SEL(_this,0);
_name = SEL(_this,1);

//if(isNull _player) exitWith {};
if(playerSide != west) exitWith {};

_backupmsg = createMarkerLocal [("_backupmsg" + _name), _pos];
_backupmsg setmarkertypeLocal "mil_warning";
_backupmsg setmarkercolorLocal "colorRed";
_backupmsg setmarkertextLocal format ["%1",_name];
sleep 60;
deleteMarkerLocal _backupmsg;