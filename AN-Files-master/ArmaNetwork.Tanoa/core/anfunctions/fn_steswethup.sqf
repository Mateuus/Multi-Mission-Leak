/*
	File: fn_surrender.sqf
	Author: MrKraken

	Description:
	places player into a surrendered state!
*/

player setVariable ["surrender", true, true];

while { player getVariable ["surrender", false] }  do {
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};
player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
