// core\actions\fn_suicideBomb.sqf
//////////////////////////////////
/*
	ALAH SNACKBAR! 
	Taken from a midgetgrimm post
	Edit: blaster



[[0,format["%1 has set off their suicide vest.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
*/
private["_boom", "_list"];
if(vest player != "SuicideVest") exitWith {};
if(life_isSuiciding) exitWith {};
if(life_isDeadman) exitWith {};
life_isSuiciding = true;

[[player, "AllohaSnackbarr",50],"life_fnc_playSound",true,false] spawn life_fnc_MP;
sleep 10;


if(vest player != "SuicideVest") exitWith {life_isSuicide = false;};
if((player getVariable "restrained")) exitWith {life_isSuicide = false;}; //He's restrained.
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

life_isSuiciding = false;
life_isDeadman = false;

player setVariable["tied", false, true];
player setVariable["restrained", false, true];
player setVariable["eg_cancelRevive", true, true];
[] call SOCK_fnc_updateRequest;

[[0,format["BREAKING NEWS: A suicide vest was detonated by %1!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
