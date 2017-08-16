 
waituntil {time > 120}; // give some time 
 
// Play Music in the Club 
[] spawn { 
 WaitUntil {!isNil "clubSoundSource"}; 
 while {alive clubSoundSource} do { 
 [[clubSoundSource,"clubmusic"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
 sleep 43.389; 
 }; 
}; 
/* 
// Pussylover Speaker at Billboard 
[] spawn { 
 waitUntil {!isNil "clubspeaker"}; 
 while {alive clubspeaker} do { 
 [[clubspeaker,"pussylover"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
 sleep 200; 
 sleep (round random 60); 
 }; 
}; 
*/ 
diag_log "Titty Twister Club Sound on";