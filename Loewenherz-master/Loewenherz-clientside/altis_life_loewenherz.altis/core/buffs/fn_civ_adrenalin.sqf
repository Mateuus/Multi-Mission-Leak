//[player,LHM_AdrenalinDuration] spawn lhm_fnc_cop_adrenalin;

Private ["_player","_side","_AdrenalinDuration"];
_player = _this select 0;
_AdrenalinDuration = _this select 1;
_side = side _player;
if (_side == civilian) then {
	LHM_AdrenalinBuffTimer = _AdrenalinDuration;
	_player setFatigue 0;
	_player enableFatigue false;
	titleText[format["Du kannst nun fuer %1 Minuten laenger rennen",round(LHM_AdrenalinBuffTimer / 60)],"PLAIN"];
	while {(LHM_AdrenalinBuffTimer > 0) && alive player} do {
		sleep 1;
		LHM_AdrenalinBuffTimer = LHM_AdrenalinBuffTimer - 1;
	};
	titleText[format["Adrenalin Effekt schwindet..."],"PLAIN"];	
	_player enableFatigue true;		
	LHM_AdrenalinBuffTimer = 0;
} else {

};