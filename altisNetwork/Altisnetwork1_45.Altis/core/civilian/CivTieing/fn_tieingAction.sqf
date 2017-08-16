/*
	File: fn_restrainAction.sqf


	Description:
	Retrains the target.
*/

private["_unit"];
_unit = cursorTarget;

if(life_inv_zipties < 1) exitWith {
	hintSilent "You need to buy zipties from the market to do this..";
};

if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith {
	hintSilent "You can not do that.";
};

if(!(_unit getVariable ["playerSurrender",false]) || animationState cursorObject == "Incapacitated") exitWith {
	hintSilent "Your target has to surrender or be knocked outfirst!";
};

if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable ["tied", false])) exitWith {};

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

life_inv_zipties = life_inv_zipties - 1;

life_action_inUse = true;
hintSilent "Restraining!";
[_unit,"zipties"] remoteExec ["life_fnc_say3D",RANY];

_randycunt = 3;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
	_randycunt = _randycunt - 1;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1;
};

_unit setVariable["tied", true, true];
[player] remoteExecCall ["life_fnc_tieing", _unit];

life_action_inUse = false;
