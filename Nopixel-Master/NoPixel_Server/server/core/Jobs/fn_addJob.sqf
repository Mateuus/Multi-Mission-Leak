 
 
activejobs = []; 
 
if(isNil "processJobs") then { processingJobs = false; }; 
if(!processingJobs) exitwith {}; 
processingjobs = true; 
 
_jobcount = count currentMailmen; 
 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Fedex Worker";  
}; 
 
_jobcount = count currentsecurity; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Security";  
}; 
 
 
_jobcount = count currentTowTruckDrivers; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Tow Truck Driver";  
}; 
 
 
_jobcount = count currentTrashMan; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Garbage Man";  
}; 
 
 
_jobcount = count currentNewsMan; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "News Reporter";  
}; 
 
 
_jobcount = count currentRepairmen; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Repairman";  
}; 
 
 
_jobcount = count currentTaxiDrivers; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Taxi Driver";  
}; 
 
 
_jobcount = count currentLegalAid; 
while{true} do {  
diag_log ["job adding %1", _jobcount]; 
if(_jobcount > 4) exitwith {};  
_jobcount = _jobcount + 1;  
activeJobs pushback "Legal Aid";  
}; 
 
sleep 1; 
 
processingjobs = false; 
