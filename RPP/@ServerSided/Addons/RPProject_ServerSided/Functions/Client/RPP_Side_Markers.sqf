/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Side_Markers.sqf

Description:
Markers on the map for emts and cops
*/
["RPP_MapMarkers", {
	[] spawn {
		while {true} do {
			if (RPP_isCop) then {
				_CopMarkers = [];
				{
					if (side _x isEqualTo west) then {
						_CopMarker = createMarkerLocal [('CopPos_' + name _x), getpos _x];
						_CopMarker setMarkerColorLocal 'ColorBlue';
						_CopMarker setMarkerTypeLocal 'mil_dot';
						_CopMarker setMarkerTextLocal format ['POLICE: %1',name _x];
						_CopMarkers = _CopMarkers + [_CopMarker];

					};
				} foreach playableUnits;
				sleep 1.5;
				{
					deleteMarker _x;
				} foreach _CopMarkers;
			};
			if (RPP_isEMT) then {
				_EMTMarkers = [];
				{
					if (side _x == resistance) then {
						_EMTMarker = createMarkerLocal [('EMTPos_' + name _x), getpos _x];
						_EMTMarker setMarkerColorLocal 'ColorBlue';
						_EMTMarker setMarkerTypeLocal 'mil_dot';
						_EMTMarker setMarkerTextLocal format ['EMT: %1',name _x];
						_EMTMarkers = _EMTMarkers + [_EMTMarker];
					};
				} foreach playableUnits;
				sleep 1.5;
				{
					deleteMarker _x;
				} foreach _EMTMarkers;
			};
			if (RPP_isCiv) then {
				CivMarker = createMarkerLocal [("CivPos_" + getPlayerUID player), getpos player];
				CivMarker setMarkerColorLocal "ColorGreen";
				CivMarker setMarkerTypeLocal "mil_dot";
				CivMarker setMarkerTextLocal format ["%1",name player];
				sleep 1.5;
				deleteMarker CivMarker;
			};
			sleep 1;
		};
	};
}] call RPP_Function;
publicVariable 'RPP_MapMarkers';