private ["_UID"];

_UID = getPlayerUID player;



if(_UID in adminlist5) then {

life_markers = !life_markers;
if(life_markers) then {
	PlayerMarkers = [];
	FinishedLoop = false;
	while{life_markers} do {
		{
			if !(_x in allUnits) then {
				deleteMarkerLocal str _x;
			};
		} forEach PlayerMarkers;
		PlayerMarkers = [];
		{
			if(alive _x && isplayer _x) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "waypoint";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerTextLocal format['%1 (%2)',_x getVariable["realname",name _x],side _x];
				_pSee setMarkerColorLocal ("ColorPink");
				PlayerMarkers = PlayerMarkers + [_x];
		};
	} forEach allUnits;
	sleep 0.5;
};
FinishedLoop = true;
} else {
	if(isNil "FinishedLoop") exitWith {};
	waitUntil{FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach PlayerMarkers;	
};

};