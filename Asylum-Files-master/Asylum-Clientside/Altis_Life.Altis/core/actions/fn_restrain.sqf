/*
	File: fn_restrain.sqf
	Author: Skalicon
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if((_unit getVariable ["restrained",false])) exitWith {};
if((_unit getVariable ["Escorting",false])) exitWith {};
if(isNull _unit) exitWith {};
if(player == _unit) exitWith {};
if (vehicle player != player) exitWith {};

_restrainSound = "handcuffs";
if (side player != west) then {
	if(life_inv_ziptie < 1) exitWith {hint"You need a zip tie to restrain someone."};
	if(!([false,"ziptie",1] call life_fnc_handleInv)) exitWith {};
	if (!((getPlayerUID _unit) in life_bounty_uid) && group _unit != group player) then
	{

		_exit =
		{
			if(getPlayerUID _unit in (_x getVariable["myBounties",[]])) exitWith {true}; false
		} forEach (units group player - [player]);
		if(!isNil "_exit" && {_exit} && {126 in life_talents}) exitWith {};
		serv_killed = [player,"209"]; publicVariableServer "serv_killed";
	};
	_restrainSound = "ziptie";
};

[[_unit, _restrainSound ,10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[player,_unit],"life_fnc_restrainAction",_unit,false] spawn life_fnc_MP;