private["_commit","_time"];
_commit = _this select 0;
if(isNil "_commit") exitWith {};

_time = diag_tickTime;

while {diag_tickTime - _time < _commit} do {

	playSound "heartbeat_1";
	addCamShake [2, 0.5, 25];
	0 fadeSound (random 1);

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [4];
	"dynamicBlur" ppEffectCommit 0.2;


	uisleep 0.5;

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [1];
	"dynamicBlur" ppEffectCommit 0.5;

	uisleep 0.5;
};
3 fadeSound 1;
"dynamicBlur" ppEffectEnable false;
"ChromAberration" ppEffectEnable false;

//ppEffectDestroy _blur;
//ppEffectDestroy _chrom;

/*

0 = ["ChromAberration", 200, [0.05, 0.05, true]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 5;
	waitUntil {ppEffectCommitted _handle};
	uiSleep 3;
	comment "admire effect for a sec";
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};




"ChromAberration" ppEffectEnable true;
"ChromAberration" ppEffectAdjust [0.50, 0.50, true];
"ChromAberration" ppEffectCommit 0;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [20];
"dynamicBlur" ppEffectCommit 0;

enableCamShake true;
addCamShake [0.4, _commit, (round random 100)];

"ChromAberration" ppEffectAdjust [0.50, 0.50, true];
"ChromAberration" ppEffectCommit _commit;

"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit _commit;

