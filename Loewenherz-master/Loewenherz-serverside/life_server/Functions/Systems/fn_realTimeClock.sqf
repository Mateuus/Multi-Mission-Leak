/* 
 Filename: fn_realTimeClock.sqf 
 
 Description: updates the Realtime Clock for the clients 
 
 Author: Blackd0g 
*/ 
private ["_result"]; 
 
while {true} do { 
 _result = "extDB2" callExtension format ["0:%1:TIME:2", (call MISC_ID)]; 
 lhm_clock = call compile format["%1", _result]; 
 lhm_clock = lhm_clock select 1; 
 publicVariable "LHM_Clock"; 
 
 uisleep 60; 
};