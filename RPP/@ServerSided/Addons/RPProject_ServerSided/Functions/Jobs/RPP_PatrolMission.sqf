/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PatrolMission.sqf

Description:
Patrol mission for cops
*/

["RPP_PatrolMission_Take", {
	if (!(RPP_IsCop)) exitWith {
		_msg = "Only cops are able to use this!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_PatrolMission) exitWith {
		_msg = "Please finish your current Patrol mission!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	RPP_PatrolMission = true;

	_PickPoint = RPP_PatrolMission_Points call BIS_FNC_SELECTRANDOM;
	_Marker = _PickPoint select 0;
	_text = _PickPoint select 1;

	_msg = format ["You are going to %1",_text];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;

	RPP_PatrolMarker = createMarkerLocal ["RPP_PatrolPoint_" + getPlayerUID player,(getMarkerPos _Marker)];
	RPP_PatrolMarker setMarkerTypeLocal "mil_dot";
	RPP_PatrolMarker setMarkerColorLocal "mil_blue";
	RPP_PatrolMarker setMarkerTextLocal format ["%1",_text];

	RPP_PatrolMission_Pay = round(distance RPP_PatrolMarker);
}] call RPP_Function;
publicVariable "RPP_PatrolMission_Take";

["RPP_PatrolMission_Take_Lopp", {
	while {RPP_PatrolMission} do {
		if (player distance (getMarkerPos RPP_PatrolMarker) <= 15) exitWith {
			[RPP_PatrolMission_Pay] call RPP_AntiCheat_Addmoney;
			_msg = format ["You got paid $%1 for your work",RPP_PatrolMission_Pay];
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;

			deleteMarkerLocal RPP_PatrolMarker;
		};
	};
}] call RPP_Function;
publicVariable "RPP_PatrolMission_Take_Lopp";