 
 
 
 
 
 
 
 
private["_innocent"]; 
 
_innocent = [_this,0,true,[true]] call BIS_fnc_param; 
 
if (_innocent) then { life_trial_votes = life_trial_votes + 1; };