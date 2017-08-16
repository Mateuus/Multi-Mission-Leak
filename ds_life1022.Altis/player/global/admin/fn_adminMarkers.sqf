/*
	Darkside Life

	Author: ColinM9991

	Description:
	Toggles admin player markers on/off
*/

private ["_player","_targets","_markers","_marker"];

if((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))exitWith{closeDialog 0;};

_player = (name player);

if(DS_adminLevel < 4)then {
	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	[_player,"Map Markers On or Off"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
};

DS_markers = !DS_markers;

if(DS_markers)then {
	hint "Markers enabled";

	_markers = [];

	while {DS_markers} do {
		{
			if((alive _x)&&(isPlayer _x))then {
				_marker = createMarkerLocal [str _x,getPos _x];
				_marker setMarkerTypeLocal "Waypoint";
				_marker setMarkerPosLocal (getPos _x);
				_marker setMarkerTextLocal format ["%1 (%2)",_x getVariable ["realname",name _x],side _x];
				_marker setMarkerColorLocal "ColorPink";
				_markers pushBack _marker;
			};
		} forEach allPlayers;

		sleep 0.5;

		{deleteMarkerLocal _x;} forEach _markers;
		_markers = [];
	};
} else {
	hint "Markers disabled";
};