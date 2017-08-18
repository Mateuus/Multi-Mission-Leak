_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1,1,-0.01,[1.0, 1.0, 1.0, 0.7],[1, 1, 1, 1],[0, 0, 0, 1]];
_hndl ppEffectCommit 0;
 
sleep 3;
 
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1,1,-0.01,[0, 0, 0, 0],[1, 1, 1, 1],[0, 0, 0, 1]];
_hndl ppEffectCommit 10;
 
waitUntil {ppEffectCommitted _hndl};
 
ppEffectDestroy _hndl;