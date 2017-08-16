 
/* 
 Filename: fn_bankHeist_teaminvite.sqf 
 Author: Barney 
 
 Description: Starts the bank alarm 
*/ 
 
 
private ["_starter","_team","_counter"]; 
 
_starter = param[0,objNull,[objNull]]; 
 
_team = param[1,[],[[]]]; 
 
LHM_Group_temp = []; 
 
if(count(_team) == 0) exitWith {}; 
 
if(isnull _starter) exitWith {}; 
_counter = 0; 
 
_team = _team - [objNull]; 
[[_starter],"lhm_fnc_bankGroupAsked",_team,false] call lhm_fnc_mp; 
 
while {true} do 
{ 
 if(_counter >= 60) exitWith {}; 
 uisleep 1; 
 _counter = _counter + 1; 
}; 
 
[[LHM_Group_temp],"lhm_fnc_teamAcc",[_starter],false] call Lhm_fnc_mp; 
 
LHM_Group_temp = niL; 
 
 
 
