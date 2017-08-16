/*
	@Version: 2.3
	@Author: [BWG] Joe, Borrowed by Luxe Gaming
	@Edited: 14.11.2013
*/
private ["_pos"];

if(player getVariable ["surrender", false]) exitWith { player setVariable ["surrender", false, true];};
player setVariable ["surrender", true, true];

while { player getVariable ["surrender", false] }  do {
	player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	
	// Check if player still alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end";
