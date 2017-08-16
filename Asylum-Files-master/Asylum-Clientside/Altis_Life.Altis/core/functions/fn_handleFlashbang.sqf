/*
	File: fn_handleFlashbang.sqf
	Author: Skalicon
	
	Description: Makes flashbangs work!
*/
private["_hndl","_hnd2","_hnd3","_effects"];
_goggles = {if(_x in assignedItems player) exitWith {_x}; ""} forEach ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP"];
if(_goggles != "") then {player unassignItem _goggles};
_hndl = ppEffectCreate ["colorCorrections", 5001];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.95], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
_hndl ppEffectCommit 0;


_hnd2 = ppEffectCreate ["chromAberration", 2001];
_hnd2 ppEffectEnable true;
_hnd2 ppEffectAdjust [1, 1, true];
_hnd2 ppEffectCommit 0;


_hnd3 = ppEffectCreate ["chromAberration", 2001];
_hnd3 ppEffectEnable true;
_hnd3 ppEffectAdjust [0.5, 0.5, true];
_hnd3 ppEffectCommit 0;


playSound "Flashbang";

_eff1 = 0.95;
_eff2 = 1;
_eff3 = 0.5;
_effects = true;
sleep 4;

while {_effects} do {
	_eff1 = _eff1 - 0.00475;
	_eff2 = _eff2 - 0.005;
	_eff3 = _eff3 - 0.0025;

	_hndl ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, _eff1], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
	_hndl ppEffectCommit 0;
	_hnd2 ppEffectAdjust [_eff2, _eff2, true];
	_hnd2 ppEffectCommit 0;
	_hnd3 ppEffectAdjust [_eff3, _eff3, true];
	_hnd3 ppEffectCommit 0;
	sleep 0.01;
	if (_eff2 <= 0) then {_effects = false;};
};

ppEffectDestroy _hndl;
ppEffectDestroy _hnd2;
ppEffectDestroy _hnd3;
if(_goggles != "") then {player assignItem _goggles};