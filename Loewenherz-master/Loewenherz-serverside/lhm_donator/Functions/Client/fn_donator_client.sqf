if (isServer) then { 
 //ServerCode 
 (_this) spawn { 
  waitUntil{sleep (random .05); (time > 1)}; 
  diag_log format["DONATOR: Mission ready, initializing Donator Functions..."]; 
  [_this] spawn lhm_fnc_getDonatorLevel; 
  [_this] spawn lhm_fnc_getHousingSpawns; 
 }; 
}; 
 
if (!isDedicated) then { 
 //Client Code 
 //diag_log format["DEBUG: Running C_man_1 Init: _this = %1 isPlayer = %2 Owner: %3 %1 in playableunits: %4)",_this,(isPlayer _this),(owner _this),(_this in playableunits)]; 
 
 (_this) spawn { 
  [] call lhm_fnc_DonWeapDropConfig; 
  //waitUntil {sleep (random .05); !isNil "lhm_fnc_setupActions";}; 
  diag_log format["DONATOR: Waiting for Donator Level..."]; 
  waitUntil {sleep (random .05); !isNil "LHM_VAR_DonLvlReady"}; 
  diag_log format["DONATOR: Got DonatorLevel: %1 and playerSide = %2",(_this getVariable ["LHM_Donatorlevel",0]),playerSide]; 
  // Switch through Donator level and set a new amount of the paycheck 
  /* 
  lhm_paycheck = switch (playerSide) do { 
   case west: {500}; 
   case civilian: {350}; 
   case independent: {450}; 
   case east: {450}; 
  }; 
  switch(_this getVariable ["LHM_Donatorlevel",0]) do { 
    case 1: {lhm_paycheck = lhm_paycheck + 750;}; 
    case 2: {lhm_paycheck = lhm_paycheck + 1500;}; 
    case 3: {lhm_paycheck = lhm_paycheck + 2000;}; 
    case 4: {lhm_paycheck = lhm_paycheck + 2500;}; 
    case 5: {lhm_paycheck = lhm_paycheck + 3500;}; 
  }; 
  lhm_paycheck = compileFinal str(lhm_paycheck); 
  diag_log format ["DONATOR: Paycheck sets to %1", (call lhm_paycheck)]; 
  */ 
 }; 
 
};