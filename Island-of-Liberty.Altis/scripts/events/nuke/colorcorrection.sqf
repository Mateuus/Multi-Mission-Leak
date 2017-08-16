//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// EDITED VERSION OF THE ARMA2 ORIGINAL SCRIPT
// ARMED-ASSAULT.DE
// 06.11.2013
//////////////////////////////////////////////////////////////

"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
"colorCorrections" ppEffectCommit 3;
"colorCorrections" ppEffectEnable true;
"filmGrain" ppEffectEnable true; 
"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
"filmGrain" ppEffectCommit 5;

sleep 1200;

"ColorCorrections" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust [ 1, 1, -0.03, [ 0, 0, 0, 0 ], [ 0.4, 0.3, 0.2, 1.3 ], [ 1, 1, 1, 0 ] ];
"ColorCorrections" ppEffectCommit 0;