/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/

private["_unit"];
_unit = cursorTarget;
if((life_action_inUse) || (player getVariable "tied") || (player getVariable "restrained")) exitWith { 
hint "You can't do that!";
}; 
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "tied")) exitWith {};

if(!([false,"ziptie",1] call life_fnc_handleInv)) exitWith {
hint "You need to buy zipties to do that!";
};

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

life_action_inUse = true;
hint "Restraining!";

[[player, "tieup",125],"life_fnc_playSound",true,false] spawn life_fnc_MP; 
_randycunt = 7;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
_randycunt = _randycunt - 1;
player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep 1;
};
if( _unit distance _myposy > 5 ) then { 
		titleText["Target to far away!.","PLAIN"];
} else {
	_unit setVariable["tied",true,true];
	[[player], "life_fnc_tieing", _unit, false] spawn life_fnc_MP;
	life_rope = 1;
};
life_action_inUse = false;
