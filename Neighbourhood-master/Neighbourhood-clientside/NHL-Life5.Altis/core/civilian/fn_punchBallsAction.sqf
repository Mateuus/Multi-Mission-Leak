/*
  Modified knockout action which was created by Tonic.
    punchBallsAction.sqf
    By Dr. Dank

*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 5) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End1"],"life_fnc_animSync",_target,false] spawn life_fnc_MP;
sleep 0.08;
[[_target,profileName],"life_fnc_punchBalls",_target,false] spawn life_fnc_MP;

sleep 3;
life_knockout = false;