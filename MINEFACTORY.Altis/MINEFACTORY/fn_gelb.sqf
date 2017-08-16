

_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust 
[1, // brightness
1,  // contrast 
-0.01, // offset  
[1.0, 0.7, 0.0, 0.7], //  blend color (R,G,B,A)  
[1, 1, 1, 1], //  colorize color (R,G,B,A)  
[0, 0, 0, 1] //  colorize color (R,G,B,A)  
];
_hndl ppEffectCommit 0;

sleep 3;

_hndl ppEffectEnable true;
_hndl ppEffectAdjust 
[1, // brightness
1,  // contrast 
-0.01, // offset  
[0, 0, 0, 0], //  blend color (R,G,B,A)  
[1, 1, 1, 1], //  colorize color (R,G,B,A)  
[0, 0, 0, 1] //  colorize color (R,G,B,A)  
];
_hndl ppEffectCommit 10;

waitUntil {ppEffectCommitted _hndl};

ppEffectDestroy _hndl;