/*
	ALAH SNACKBAR! 
	Taken from a midgetgrimm post
	Edit: blaster



[[0,format["%1 has set off their suicide vest.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
*/
private["_boom"];
if(vest player != "SuicideVest") exitWith {};
if(life_isSuiciding) exitWith {};
// if((player getVariable "restrained")) exitWith {}; //He's restrained.
// if((player getVariable "tied")) exitWith {}; //He's restrained.
if(life_isDeadman) exitWith {};

waitUntil {vest player != "SuicideVest" or !(alive player)};

life_isDeadman = true;

if(!(player getVariable "tied") && !(player getVariable "restrained")) then {
	
	_boom = "Bo_Mk82" createVehicle [0,0,9999];
	_boom setPos (getPos player);
	_boom setVelocity [100,0,0];
	if(alive player) then {player setDamage 1;};
	removeVest player;
	removeHeadgear player:
	removeGoggles player;
	removeVest player;
	removeBackpack player;
	removeUniform player;
	removeAllWeapons player:
	removeAllAssignedItems player;

	life_isDeadman = false;
	player setVariable["eg_cancelRevive", true, true];
	[] call SOCK_fnc_updateRequest;

	[[0,format["BREAKING NEWS: A suicide vest was detonated by %1!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	} else {
		hint "You're restrained you can't blow up now, dumbass";
		life_isSuiciding = false;
		life_isDeadman = false;

};

