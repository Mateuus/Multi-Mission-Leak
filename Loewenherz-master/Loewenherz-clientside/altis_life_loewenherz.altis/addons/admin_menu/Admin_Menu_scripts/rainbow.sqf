hint "Open the Map and Select the Map Position you want to rainbow";
sCode = 'hint "Rainbow incomming, RUN!";';
sCode = sCode + 'cpbLoops = 7;';
sCode = sCode + 'cpLoopsDelay = 5.0;';
sCode = sCode + 'for "_i" from 0 to cpbLoops do {';
sCode = sCode + '"SmokeShell" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + '"SmokeShellYellow" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + '"SmokeShellRed" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + '"SmokeShellGreen" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + '"SmokeShellPurple" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + '"SmokeShellBlue" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + '"SmokeShellOrange " createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 200]);';
sCode = sCode + 'sleep cpLoopsDelay;};';
sCode = sCode + 'cTargetPos = nil;cpbLoops = nil;cpLoopsDelay = nil;';

onMapSingleClick "cTargetPos = _pos;[] spawn compile sCode; onMapSingleClick '';true;";