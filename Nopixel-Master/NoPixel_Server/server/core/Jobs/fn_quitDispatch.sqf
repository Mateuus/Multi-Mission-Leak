 
 
_player = _this select 0; 
 
if (_player IN currentPoliceDispatch) then {   
_pia = currentPoliceDispatch find _player; 
currentPoliceDispatch deleteAt _pia; 
}; 
 
if (_player IN currentMedicDispatch) then {  
_pia = currentMedicDispatch find _player; 
currentMedicDispatch deleteAt _pia; 
}; 
 
if (_player IN currentFireDispatch) then {  
_pia = currentFireDispatch find _player; 
currentFireDispatch deleteAt _pia; 
}; 
