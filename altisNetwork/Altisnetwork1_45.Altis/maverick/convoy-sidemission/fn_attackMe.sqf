scriptName "fn_attackMe";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_attackMe.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_attackMe.sqf"

_time = getNumber(missionConfigFile >> "Maverick_ConvoySidemission" >> "Config" >> "MakePlayersHostileFor");
hint format["Attention: You have engaged a convoy. You are hostile towards all players for %1 minutes. You cannot enter vehicles of friends, only drive them alone.",_time / 60];
mav_convoy_attackme_scriptthread = _time spawn {
	while {rating player > -100000} do {
		player addRating -50000000000;
	};
	sleep _this;
	while {rating player < 1000000} do {
		player addRating 50000000000;
	};
	hint "You are not not hostile anymore.";
	mav_convoy_attackme_scriptthread = nil;
};

player addEventHandler ["Killed",{
	diag_log "Unit has died, not hostile to convoy anymore";
	if (!isNil "mav_convoy_attackme_scriptthread") then {
		terminate mav_convoy_attackme_scriptthread;
		mav_convoy_attackme_scriptthread = nil;
	};
}];