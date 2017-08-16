 
_player = _this select 0; 
 
_information = [ 
 
["Police Dispatch",currentPoliceDispatch], 
["Medic Dispatch",currentMedicDispatch], 
["Fire Dispatch",currentFireDispatch], 
["Security",currentSecurity], 
["Legal Aid",currentLegalAid], 
["Repairmen",currentRepairmen], 
["Judges",currentJudges], 
["Lawyers",currentLawyers], 
["Mail Men",currentMailmen], 
["Tow Trucks",currentTowTruckDrivers], 
["News Worker",currentNewsMan], 
["Taxi",currentTaxiDrivers] 
 
]; 
 
[_information] remoteExec ["client_fnc_updatePhonebook",_player]; 
 
 
diag_log ["retreive phonebook %1", _player]; 
 
