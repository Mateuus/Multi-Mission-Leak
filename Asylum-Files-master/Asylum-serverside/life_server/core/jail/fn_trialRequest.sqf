 
 
 
 
 
 
 
 
private["_unit","_jailId","_start","_soundOn","_dispatch"]; 
 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
_amount = [_this,1,1,[1]] call BIS_fnc_param; 
 
if (isNull _unit || life_trial_inprogress) exitWith {}; 
 
life_trial_inprogress = true; 
publicVariable "life_trial_inprogress"; 
 
_startTime = time; 
life_trial_jury = []; 
life_trial_jury_invites = []; 
_juryPool = []; 
{ 
if (side _x == civilian && _x distance (getMarkerPos "jail_marker2") > 70) then { _juryPool pushBack _x; }; 
} forEach allPlayers; 
 
while {(count life_trial_jury_invites) < 30 && (count _juryPool) > 0} do 
{ 
_randomGuy = _juryPool call BIS_fnc_selectRandom; 
if (!(_randomGuy in life_trial_jury_invites)) then 
{ 
life_trial_jury_invites pushBack _randomGuy; 
_juryPool = _juryPool - [_randomGuy]; 
}; 
}; 
 
{ 
[[_unit,_amount,_startTime],"life_fnc_jurySummons",_x,false] spawn life_fnc_MP; 
} forEach life_trial_jury_invites; 
 
waitUntil { time - _startTime > 160 || (count life_trial_jury) == 12 || isNull _unit }; 
 
if ((count life_trial_jury) > 3 && !isNull _unit) then 
{ 
[_unit,_amount] call life_fnc_trialBegin; 
} 
else 
{ 
life_trial_inprogress = false; 
publicVariable "life_trial_inprogress"; 
{ 
_reward = 2000; 
[[[0,2], format["The trial for which you were summoned has been cancelled.  The convicted will serve their sentence.  You have been awarded $%1 for answering your Summons.",[_reward] call life_fnc_numberText]],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
[["atm","add",_reward],"life_fnc_uC",_x,false] spawn life_fnc_MP; 
life_jury_registered = nil; 
(_x getVariable ["ownerID", -1]) publicVariableClient "life_jury_registered"; 
} forEach life_trial_jury; 
 
if(isNull _unit) exitWith {};  
[[[0,2], "Your request for a trial was denied. Enjoy your stay!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
};