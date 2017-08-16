 
 
 
_player = _this select 0; 
_jobtype = _this select 1; 
 
diag_log ["job starting %1 - %2", _player,_jobtype]; 
 
if (str _jobtype find "Cop" > -1) exitwith {    
if(count currentCop < 10) then { 
[_player, 0, getplayeruid _player, 0] call Server_fnc_statSave; 
[] remoteExec ["client_fnc_startCop",_player]; 
_player setvariable ["sync",0,false]; 
currentCop pushback _player; 
publicvariable "currentCop"; 
 
} else { 
"Too many on duty" remoteexec ["hint",_player]; 
}; 
}; 
 
if (str _jobtype find "EMS" > -1) exitwith {   
if(count currentEMS < 5) then { 
[_player, 0, getplayeruid _player, 0] call Server_fnc_statSave;   
[] remoteExec ["client_fnc_startEMS",_player]; 
_player setvariable ["sync",0,false]; 
currentEMS pushback _player; 
publicvariable "currentEMS"; 
} else { 
 
"Too many on duty" remoteexec ["hint",_player]; 
}; 
}; 
 
if (str _jobtype find "Fire" > -1) exitwith {   
if(count currentFire < 5) then { 
[_player, 0, getplayeruid _player, 0] call Server_fnc_statSave;   
[] remoteExec ["client_fnc_startFire",_player]; 
currentFire pushback _player; 
_player setvariable ["sync",0,false]; 
publicvariable "currentFire"; 
} else { 
 
"Too many on duty" remoteexec ["hint",_player]; 
};   
}; 
 
if (str _jobtype find "Mafia" > -1) exitwith {    
if(count currentMafia < 10) then { 
[] remoteExec ["client_fnc_startMafia",_player]; 
currentMafia pushback _player; 
publicvariable "currentMafia"; 
} else { 
 
"Too many on duty" remoteexec ["hint",_player]; 
};  
}; 
 
 
 
if (str _jobtype find "Police Dispatch" > -1) exitwith {    
[] remoteExec ["client_fnc_startDispatch",_player]; 
currentPoliceDispatch pushback _player; 
publicvariable "currentPoliceDispatch"; 
 
}; 
 
if (str _jobtype find "Medic Dispatch" > -1) exitwith { 
[] remoteExec ["client_fnc_startDispatch",_player]; 
currentMedicDispatch pushback _player; 
publicvariable "currentMedicDispatch"; 
 
}; 
 
if (str _jobtype find "Fire Dispatch" > -1) exitwith { 
[] remoteExec ["client_fnc_startDispatch",_player]; 
currentFireDispatch pushback _player; 
publicvariable "currentFireDispatch"; 
 
}; 
 
if (str _jobtype find "Fedex Worker" > -1) exitwith { 
[] remoteExec ["client_fnc_mailSystem",_player]; 
currentmailmen pushback _player; 
publicvariable "currentMailMen"; 
 
}; 
 
if (str _jobtype find "Taxi Driver" > -1) exitwith { 
[] remoteExec ["client_fnc_startTaxi",_player]; 
currentTaxiDrivers pushback _player; 
publicvariable "currentTaxiDrivers"; 
 
}; 
 
if (str _jobtype find "Security" > -1) exitwith { 
[] remoteExec ["client_fnc_startSecurity",_player]; 
currentsecurity pushback _player; 
publicvariable "currentSecurity"; 
 
}; 
 
if (str _jobtype find "Legal Aid" > -1) exitwith { 
[] remoteExec ["client_fnc_startLegalAid",_player]; 
currentlegalaid pushback _player; 
publicvariable "currentLegalAid"; 
 
}; 
 
if (str _jobtype find "Lawyer" > -1) exitwith { 
[] remoteExec ["client_fnc_startLawyer",_player]; 
currentlawyers pushback _player; 
publicvariable "currentLawyers"; 
 
}; 
 
if (str _jobtype find "Judge" > -1) exitwith { 
[] remoteExec ["client_fnc_startJudge",_player];  
currentJudges pushback _player; 
publicvariable "currentJudges"; 
 
}; 
 
if (str _jobtype find "Tow Truck Driver" > -1) exitwith { 
[] remoteExec ["client_fnc_startTowTruck",_player]; 
currentTowTruckDrivers pushback _player; 
publicvariable "currentTowTruckDrivers"; 
 
}; 
 
if (str _jobtype find "Garbage Man" > -1) exitwith { 
[] remoteExec ["client_fnc_startGarbage",_player]; 
currentTrashMan pushback _player; 
publicvariable "currentTrashman"; 
 
}; 
 
if (str _jobtype find "News Reporter" > -1) exitwith { 
[] remoteExec ["client_fnc_startNews",_player];  
currentNewsMan pushback _player; 
publicvariable "currentNewsMan"; 
 
}; 
 
if (str _jobtype find "Repairman" > -1) exitwith {  
[] remoteExec ["client_fnc_startRepair",_player]; 
currentRepairmen pushback _player; 
publicvariable "currentRepairmen"; 
 
}; 
 
 
