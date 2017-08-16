player setVariable ["surrender", true, true];

while {player getVariable ["surrender", false] && {!(player getVariable ["tased", false])}}  do {
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";

	// Check if player is alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

if (alive player) then {
  player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
};
