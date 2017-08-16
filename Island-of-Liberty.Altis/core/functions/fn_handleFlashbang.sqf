/*	
	File: fn_handleFlashbang.sqf
	Author: Skalicon
	Description: Makes flashbangs work!
*/
private["_hndl","_hnd2","_hnd3"];
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.95], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
_hndl ppEffectCommit 0;
_hnd2 = ppEffectCreate ["chromAberration", 201];
_hnd2 ppEffectEnable true;
_hnd2 ppEffectAdjust [1, 1, true];
_hnd2 ppEffectCommit 0;
_hnd3 = ppEffectCreate ["chromAberration", 201];
_hnd3 ppEffectEnable true;
_hnd3 ppEffectAdjust [0.5, 0.5, true];
_hnd3 ppEffectCommit 0;
playSound "Flashbang";
player setFatigue 1; // sets the fatigue to 100%
sleep 30;
_hndl ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.5], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
_hndl ppEffectCommit 0;
_hnd2 ppEffectAdjust [0.5, 0.5, true];
_hnd2 ppEffectCommit 0;
_hnd3 ppEffectAdjust [0.3, 0.3, true];
_hnd3 ppEffectCommit 0;
player setFatigue 1; 
// sets the fatigue to 100%
sleep 30;_hndl ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.3], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
_hndl ppEffectCommit 0;
_hnd2 ppEffectAdjust [0.3, 0.3, true];
_hnd2 ppEffectCommit 0;
_hnd3 ppEffectAdjust [0.1, 0.1, true];
_hnd3 ppEffectCommit 0;
player setFatigue 1; 
// sets the fatigue to 100%
sleep 30;
_hndl ppEffectAdjust [1.0, 1.0, 0.0, [1.0, 1.0, 1.0, 0.1], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
_hndl ppEffectCommit 0;
_hnd2 ppEffectAdjust [0.1, 0.1, true];
_hnd2 ppEffectCommit 0;
_hnd3 ppEffectAdjust [0.05, 0.05, true];
_hnd3 ppEffectCommit 0;
player setFatigue 1; 
// sets the fatigue to 100%
sleep 14;
ppEffectDestroy _hndl;
ppEffectDestroy _hnd2;
ppEffectDestroy _hnd3;