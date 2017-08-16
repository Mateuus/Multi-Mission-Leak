/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays markers for police convoys
*/

private ["_position","_temp","_marker"];

_position = _this select 0;
_position = (getMarkerPos _position);

if(_this select 1)exitWith
	{
	deleteMarkerLocal "missionMarker";
	if((DS_infoArray select 21) == 17)then {
		_tempNum = (DS_infoArray select 22) + 1;
		if(_tempNum > 4)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [22,_tempNum];
		};
	};
	if((DS_infoArray select 21) == 23)then {
		_tempNum = (DS_infoArray select 22) + 1;
		if(_tempNum > 14)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [22,_tempNum];
		};
	};
	if((DS_infoArray select 21) == 33)then {
		_tempNum = (DS_infoArray select 22) + 1;
		if(_tempNum > 19)then {
			[3] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [22,_tempNum];
		};
	};
	};

deleteMarkerLocal "missionMarker";
_marker = createMarkerLocal ["missionMarker",[0,0]];
_marker setMarkerShapeLocal "Icon";
_marker setMarkerTypeLocal "hd_warning";
_marker setMarkerColorLocal "ColorBlack";
_marker setMarkerSizeLocal [1,1];
_marker setMarkerTextLocal "Police Mission";
_marker setMarkerPosLocal _position;