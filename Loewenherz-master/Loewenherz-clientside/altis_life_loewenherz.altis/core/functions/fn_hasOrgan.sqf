/*
file: fn_hasOrgan.sqf
author: [midgetgrimm] - A Grimm lhm | Altis RPG • Index page

*/
private["_organThief"];
_organThief = param [0,Objnull,[Objnull]];
if(isNull _organThief) exitWith {}; //if not the thief get bent


[_organThief,"kidney",1] call lhm_fnc_handleInv;//put stolen kidney into inventory of thief
[[getPlayerUID _organThief,name _organThief,"919"],"lhm_fnc_wantedAdd",false,false] spawn lhm_fnc_mp;//add to wanted list
sleep 300;//no more organ theft for at least 5 minutes, so they cant just do it over and over, can do whatever time you want
_organThief setVariable["hasOrgan",false,true];//allow them to be able to take organs again- setting a variable 