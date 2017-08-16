/*
	File: fn_adminMarkers.sqf
	Sourced from Lystics Player Markers Loop
*/
if(DS_adminlevel < 4) exitWith {closeDialog 0};

private["_unit","_player","_action","_side","_spec"];

_player = (name player);
if((getPlayerUID player) in DS_adminlist4)then
	{
	[[_player,"Map Markers On or Off"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	};

DS_markers = !DS_markers;
if(DS_markers) then {
	PlayerMarkers = [];
	FinishedLoop = false;
	hint "Markers enabled";
	while{DS_markers} do {
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
	hint "Markers disabled";
	waitUntil{FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach PlayerMarkers;	
};
