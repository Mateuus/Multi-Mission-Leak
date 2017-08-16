//[player,LHM_NanoBotsDuration] spawn lhm_fnc_cop_nanobots;

Private ["_player","_side","_civtimer","_damageP","_NanoBotsDuration"];
_player = _this select 0;
_NanoBotsDuration = _this select 1;
_side = side _player;
if (_side == west || _side == independent || _side == opfor) then {
	LHM_NanoBotsBuffTimer = _NanoBotsDuration;
	titleText[format["NanoBots beginnen deinen Koerper fuer %1 Minuten zu regenerieren",round(LHM_NanoBotsBuffTimer / 60)],"PLAIN"];
	[1,[0.0,0.9,0.0]] spawn lhm_fnc_fader;
	while {(LHM_NanoBotsBuffTimer > 0) && ((alive player) || (_side == independent))} do {		
		sleep 1;
		LHM_NanoBotsBuffTimer = LHM_NanoBotsBuffTimer - 1;
		_damageP = damage _player;
		if (_damageP > 0) then {
			_player setDamage (_damageP - 0.005);
			[1,[0.0,0.9,0.0]] spawn lhm_fnc_fader;
		};
	};
	titleText[format["Nanobot Effekt schwindet..."],"PLAIN"];		
} else {
	titleText[format["Zivilisten sind nicht kompatibel. Dein Koerper beginnt sich zu wehren als die NanoBots anfangen dein Fleisch zu fressen"],"PLAIN"];
	_civtimer = time;
	_damageP = damage _player;
	while {(((_damageP + 0.05) < 0.99)) && ((_civtimer + 10) > time) && alive player} do {
		sleep 1;
		_damageP = damage _player;
		_player setDamage (_damageP + 0.05);
		[1,[0.5,0.0,0.0]] spawn lhm_fnc_fader;
	};			
};
LHM_NanoBotsBuffTimer = 0;	