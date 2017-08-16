 
/* 
 Filename: fn_bankHeist_teaminvite.sqf 
 Author: Barney 
 
 Description: Starts the bank alarm 
*/ 
 
 
 
_player = param[0,objNull,[objNull]]; 
if(isnull _player) exitWith {}; 
 
LHM_Group_temp pushBack _player; 
 
 
