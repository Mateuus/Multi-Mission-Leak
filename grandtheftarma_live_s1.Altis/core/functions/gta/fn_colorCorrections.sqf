/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Color corrections ppEffect
GTA_ppColor = ppEffectCreate ["colorCorrections", 2015];
GTA_ppColor ppEffectEnable true;
GTA_ppColor ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.4, 0.3, 0.2, 1.3], [1, 1, 1, 0]];
GTA_ppColor ppEffectCommit 0;
