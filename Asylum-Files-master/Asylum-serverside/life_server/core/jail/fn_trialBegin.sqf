 
 
 
 
 
 
 
 
_defendant = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
_amount = [_this,1,1,[1]] call BIS_fnc_param; 
 
if (isNull _defendant || !alive _defendant) exitWith {}; 
 
 
_defPosATL = switch (worldName) do 
{ 
case "Altis": { [24970.8,16742.2,1.26639] }; 
case "Tanoa": { [11168,11454,0.3] }; 
case "Stratis": { [7666.05,7797.5,1.26639] }; 
case "Australia": { [39293,31481,39.266] }; 
}; 
_juryPosATL = switch (worldName) do 
{ 
case "Altis": { [[24968.8,16737,2.90144],[24970,16736.9,2.90144],[24971.2,16736.9,2.90144],[24972.4,16736.9,2.90144],[24973.7,16736.9,2.90144],[24974.7,16736.9,2.90144],[24974.3,16736,2.90144],[24973.2,16735.9,2.90144],[24972.1,16735.9,2.90144],[24970.8,16736.1,2.90144],[24969.8,16736.1,2.90144],[24968.6,16736.1,2.90144]] }; 
case "Tanoa": { [[11170.8,11457,0.600006],[11169.3,11457.1,0.600006],[11168.1,11457.2,0.600006],[11166.8,11457.3,0.600006],[11170.2,11457.9,1],[11168.7,11458.1,1],[11167.2,11458.3,1],[11165.8,11458.4,1],[11171,11458.6,1.39999],[11169.6,11458.8,1.39999],[11168.1,11459,1.39999],[11166.5,11459.1,1.39999]] }; 
case "Stratis": { [[7663.51,7792.73,2.90144],[7664.46,7792.76,2.90144],[7665.47,7792.78,2.90144],[7666.6,7792.75,2.90144],[7667.69,7792.72,2.90144],[7668.99,7792.72,2.90144],[7668.99,7791.76,2.90144],[7667.93,7791.79,2.90144],[7666.75,7791.81,2.90144],[7665.49,7791.79,2.90144],[7664.35,7791.76,2.90144],[7663.08,7791.85,2.90144]] }; 
case "Australia": { [[39293.715,31476.523,40.174],[39292.523,31476.555,40.174],[39294.844,31476.5,40.174],[39291.328,31476.55,40.174],[39295.83,31476.494,40.174],[39290.3,31476.57,40.174],[39295.344,31475.904,40.175],[39294.32,31475.924,40.175],[39293.06,31475.928,40.175],[39291.887,31475.953,40.175],[39290.848,31475.95,40.175],[39289.844,31476.008,40.174]] }; 
}; 
 
life_trial_votes = 0; 
 
life_trial_inprogress = false; 
{ 
if (!(_x in life_trial_jury)) then { (_x getVariable ["ownerID", -1]) publicVariableClient "life_trial_inprogress" }; 
} forEach life_trial_jury_invites;  
life_trial_inprogress = true; 
 
life_trial_deliberating = false; 
publicVariable "life_trial_deliberating"; 
life_trial_verdict = nil; 
publicVariable "life_trial_verdict"; 
 
 
_defendant setVariable ["defendant", true, true]; 
{ 
_x setVariable ["jury", true, true]; 
} forEach life_trial_jury; 
 
 
[[],"life_fnc_trialDefendant",_defendant,false] spawn life_fnc_MP; 
_defendant setDir 180; 
_defendant setPosASL _defPosATL; 
 
 
{ 
[[_defendant,_amount],"life_fnc_trialJury",_x,false] spawn life_fnc_MP; 
_x setDir 0; 
if (worldName == "Australia") then { _x setPosATL (_juryPosATL select _forEachIndex) } 
else { _x setPosASL (_juryPosATL select _forEachIndex); }; 
} forEach life_trial_jury; 
 
 
_began = time; 
waitUntil { (time - _began) > 90 }; 
 
 
_defendant setPos (getMarkerPos "jail_marker2"); 
 
 
life_trial_deliberating = true; 
publicVariable "life_trial_deliberating"; 
_began = time; 
waitUntil { (time - _began) > 80 }; 
 
 
life_trial_verdict = false; 
if (life_trial_votes > (count life_trial_jury) * 0.7) then { life_trial_verdict = true; };  
 
publicVariable "life_trial_verdict"; 
 
life_trial_inprogress = false; 
publicVariable "life_trial_inprogress"; 
life_trial_deliberating = false; 
publicVariable "life_trial_deliberating"; 
_defendant setVariable ["defendant", nil, true]; 
{ 
if (!isNull _x) then { _x setVariable ["jury", nil, true]; }; 
} forEach life_trial_jury; 
 
 
sleep 10; 
{ 
if (_x distance (getMarkerPos "courtroom") < 50) then { _x setPos (getMarkerPos "city"); }; 
} forEach allPlayers; 
life_trial_jury = [];