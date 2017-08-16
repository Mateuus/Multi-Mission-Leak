/*
file: fn_takeOrgans.sqf
author: [midgetgrimm] - A Grimm lhm | Altis RPG • Index page

taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //if unit is null, than NO
if((_unit getVariable ["missingOrgan",FALSE])) exitWith {};//must not be missing organ already
if(player == _unit) exitWith {};//if the thief is the cursor target(dafuq) than NO
if(!([true,"kidney",1] call lhm_fnc_handleInv)) exitWith {hint "Du hast kein Platz um Organe zu lagern!"};//if no room for kidney, you cannot take their kidney, duh, waste not want not
lhm_action_inUse = true;//sets action to true as to prevent kidney spammming!!!!!!!!
player playMove "AinvPknlMstpSnonWnonDnon_medic";//makes the thief do an animation as to seem like they are doing surgery
sleep 3;//length of action, had weird results with any higher - obv not realistic, but whatever
_unit setVariable["missingOrgan",true,true];//sets the missing organ variable so effects can take place
lhm_action_inUse = false;//once variables are set, and actions stop, then you can use scrolly wheely
[[player], "lhm_fnc_hasOrgan", _unit, false] spawn lhm_fnc_mp;//this then calls the fn_hasOrgan.sqf on the thief 