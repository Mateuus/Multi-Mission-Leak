/*
	File: fn_restrainAction.sqf


	Description:
	Retrains the target.
*/

private["_unit"];
_unit = cursorTarget;

if(life_inv_zipties < 1) exitWith {
	hintSilent "Du brauchst Kabelbinder für diese Aktion..";
};

if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith {
	hintSilent "Du kannst das nicht.";
};

if(!(_unit getVariable ["playerSurrender",false]) || animationState cursorObject == "Incapacitated") exitWith {
	hintSilent "Die Person muss die Hände hinter dem Kopf haben.";
};

if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable ["tied", false])) exitWith {};

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

life_inv_zipties = life_inv_zipties - 1;

life_action_inUse = true;
hintSilent "Festgenommen!";
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
