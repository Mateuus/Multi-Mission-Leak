hint "Select a position on the MAP (press M) for Flares";
sCode = 'hint "Flares incoming...";';
sCode = sCode + 'cpbLoops = 15;';
sCode = sCode + 'cpLoopsDelay = 5.0;';
sCode = sCode + 'for "_i" from 0 to cpbLoops do {';

sCode = sCode + '"Sub_F_Signal_Green" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 100]);';

sCode = sCode + '"Sub_F_Signal_Red" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 100]);';

sCode = sCode + '"Sub_F_Signal_Green" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 100]);';

sCode = sCode + '"Sub_F_Signal_Red" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 100]);';

sCode = sCode + '"Sub_F_Signal_Green" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 100]);';

sCode = sCode + '"Sub_F_Signal_Red" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 100]);';

sCode = sCode + 'sleep cpLoopsDelay;};';
sCode = sCode + 'cTargetPos = nil;cpbLoops = nil;cpLoopsDelay = nil;';

onMapSingleClick "cTargetPos = _pos;[] spawn compile sCode; onMapSingleClick '';true;";