//[player,LHM_SoylentGreenBuffDuration] spawn lhm_fnc_cop_SoylentGreenBuff;

Private ["_player","_side","_civtimer","_SoylentGreenBuffDuration"];
_player = _this select 0;
_SoylentGreenBuffDuration = _this select 1;
_side = side _player;
if (_side == west || _side == independent || _side == opfor) then {
	waitUntil{!isNil "lhm_hunger"};
	LHM_SoylentGreenBuffTimer = _SoylentGreenBuffDuration;
	titleText[format["Du hast ein Soylent Green Buff fuer %1 Minuten",round(LHM_SoylentGreenBuffTimer / 60)],"PLAIN"];
	[1,[0.0,0.5,0.9]] spawn lhm_fnc_fader;
	while {(LHM_SoylentGreenBuffTimer > 0) && ((alive player) || (_side == independent))} do {		
		sleep 1;
		LHM_SoylentGreenBuffTimer = LHM_SoylentGreenBuffTimer - 1;
		if ((lhm_hunger < 100) || (lhm_thirst < 100)) then {
			lhm_hunger = lhm_hunger + 1;
			lhm_thirst = lhm_thirst + 1;
			[1,[0.0,0.5,0.9]] spawn lhm_fnc_fader;
		};
	};
	titleText[format["Soylent Green Effect fades of..."],"PLAIN"];		
} else {
	titleText[format["Zivilisten sind inkompatibel zu Soylent Green ..."],"PLAIN"];
	_civtimer = time;
	_damageP = damage _player;
	while {((lhm_hunger > 10) && (lhm_thirst > 10)) && ((_civtimer + 10) > time) && alive player} do {
		sleep 1;
		lhm_hunger = lhm_hunger - 5;
		lhm_thirst = lhm_thirst - 5;
		[1,[0.7,0.4,0.7]] spawn lhm_fnc_fader;
	};			
};
LHM_SoylentGreenBuffTimer = 0;	