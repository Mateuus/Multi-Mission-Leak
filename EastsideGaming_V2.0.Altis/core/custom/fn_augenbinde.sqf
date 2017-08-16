/*
	Script by Basti | Gustav Krone
*/

if(player getVariable ["esg_augenbinde",false])exitWith{};
titleText["Dir wurde eine Augenbinde aufgesetzt!","PLAIN"];
player setVariable ["esg_augenbinde", true, true];
0 = ["ColorCorrections", 1500, [
	0.02, 
	0.2, 
	0, 
	0, 0, 0, 0, 
	1, 1, 1, 0, 
	1, 1, 1, 0
]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 2;
	waitUntil {ppEffectCommitted _handle};
	waituntil {!(player getVariable ["esg_augenbinde",false]) || !(player getVariable ["restrained",false])};
	titleText["Dir wurde deine Augenbinde abgenommen!","PLAIN"];
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};