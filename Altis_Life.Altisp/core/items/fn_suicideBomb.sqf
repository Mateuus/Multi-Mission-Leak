/*
    ALAH SNACKBAR!
    Taken from a DSCHA {Daniel} Is Ass post
[0,format["%1 has set off their suicide vest.",name player]] remoteExec ["life_fnc_broadcast",0];
*/
private["_boom", "_list"];
if(vest player != "V_HarnessOGL_brn") exitWith {};
if(life_isSuicide) exitWith {};
if(life_knockout) exitWith {};
if(safezone) exitWith {};
life_isSuiciding = true;
[player, "allahu"] call life_fnc_globalSound;
player say3D "allahu";
[0,format["%1 się zaraz wysadzi!",profileName]] remoteExec ["life_fnc_broadcast",0];
sleep 2.5;

if(vest player != "V_HarnessOGL_brn") exitWith {life_isSuiciding = false;};
if((player getVariable "restrained")) exitWith {life_isSuiciding = false;}; //He's restrained.
if((player getVariable "tied")) exitWith {life_isSuiciding = false;}; //He's restrained.
//BOOM
removeVest player;
removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];
if(alive player) then {player setDamage 1;};
life_isSuicide = false;
life_isDeadman = false;
life_isSuiciding = false;
player setVariable["tied", false, true];
player setVariable["restrained", false, true];
player setVariable["eg_cancelRevive", true, true];
[] call SOCK_fnc_updateRequest;
[0,format["BREAKING NEWS: Pas szahida został zdetonowany przez %1!",profileName]] remoteExec ["life_fnc_broadcast",0];
