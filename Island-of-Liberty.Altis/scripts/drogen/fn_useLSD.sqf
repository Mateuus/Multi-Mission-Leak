
if (player getVariable ["useLSD", false]) exitWith {};

player setVariable ["useLSD", true, true];

[] spawn {
	sleep 120 + random 240;
	player setVariable ["useLSD", false, true];
};

[] spawn {
	"colorInversion" ppEffectEnable true;
	while {player getVariable ["useLSD", true]} do {
		"colorInversion" ppEffectAdjust [random 1,random 1,random 1];
		"colorInversion" ppEffectCommit 1;
		sleep 3 + random 7;
	};
	"colorInversion" ppEffectEnable false;
};

[] spawn {
	"dynamicBlur" ppEffectEnable true;
	while {player getVariable ["useLSD", true]} do {
		"dynamicBlur" ppEffectAdjust [random 3];
		"dynamicBlur" ppEffectCommit 0.5;
		sleep 3 + random 7;
	};
	"dynamicBlur" ppEffectEnable false;
};

[] spawn {
	"chromAberration" ppEffectEnable true;
	while {player getVariable ["useLSD", true]} do {
		"chromAberration" ppEffectEnable true;
		"ChromAberration" ppEffectAdjust[0.24, 0, true];
		"chromAberration" ppEffectCommit (0.3 + random 0.1);
	waituntil {ppEffectCommitted "chromAberration"};
	sleep 3 + random 7;
	};
	"chromAberration" ppEffectEnable false;
};