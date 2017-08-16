#include "..\..\script_macros.hpp"
/*
    ALAH SNACKBAR! 
*/
private["_boom", "_list"];
_player = player;
if(vest player != "V_HarnessOGL_gry") exitWith {};
if(life_isSuicide) exitWith {};
life_isSuiciding = true;

[player,"akbar"] remoteExec ["life_fnc_say3D",RANY];
sleep 8;


if(vest player != "V_HarnessOGL_gry") exitWith {life_isSuiciding = false;};
if((player getVariable "restrained")) exitWith {life_isSuiciding = false;}; //He's restrained.
if((player getVariable "zipted")) exitWith {life_isSuiciding = false;}; //He's restrained.

//BOOM    
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];
removeVest player;
removeAllWeapons player;
removeAllAssignedItems player;

if(alive player) then {player setDamage 1;};

life_isSuicide = false;

player setVariable["zipted", false, true];
player setVariable["restrained", false, true];
[] call SOCK_fnc_updateRequest;

[0,format["BREAKING NEWS: A suicide vest was detonated by %1!",profileName]] remoteExec ["life_fnc_broadcast",0];