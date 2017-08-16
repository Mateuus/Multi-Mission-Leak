/*
	File: fn_restrainAction.sqf
	Author: Skalicon

	Description:
	Retrains the client.
*/

private["_enforcer","_target"];
_enforcer = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_target = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_trial = param[2,false];

//Make sure we aren't in surrender mode

_target setVariable["playerSurrender",nil,true];
_obj = _target getVariable["attachedObject",objNull];
detach _target;
deleteVehicle _obj;
_target setUnconscious false;
_target setVariable["attachedObject",nil,true];

_wasCop = (side _enforcer == west || _trial);
if((isNull _enforcer)||(isNull _target)) exitWith {};
if(!_wasCop) then
{
	_target setVariable["isCivRestrained",true,true];
}
else
{
	[[_target,true],"life_fnc_setRestrained",false,false] spawn life_fnc_MP;
};
_target setVariable["restrained",true,true];
life_disable_actions = true;
life_abort_enabled = false;

if(_target getVariable["downed", false] && !_wasCop) then {waitUntil {!(_target getVariable ["downed",false])}};
[[_target,"AmovPercMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn life_fnc_MP;

disableUserInput false;
_startTime = time;
_maxRestrainTime = 10 * 60;
_wasCop = (side _enforcer == west);

if(_wasCop) then 
{
	life_old_group = group player;
	if(count units group player > 1) then {[player] join grpNull};
};
player setVariable["restrainedBy",group _enforcer,true];
_continue = true;
while {_continue} do
{
	
	if(isNull objectParent player) then {_target playMove "AmovPercMstpSnonWnonDnon_Ease"};
	waitUntil {
		_timeUp = (!_wasCop || (vehicle player == player && _wasCop && ({side _x == west && player distance _x < 500} count allPlayers == 0))) && time - _startTime > _maxRestrainTime &&  !(_target getVariable ["Escorting",false]) && !(_target getVariable ["transporting",false]);
		if(_timeUp || !(_target getVariable ["restrained",false]) || !alive _target) then {
			_continue = false;
		};
		if(vehicle player != player) then {if (driver (vehicle player) == player) then {player action ["Eject",(vehicle player)];};};
		!_continue || animationState _target != "AmovPercMstpSnonWnonDnon_Ease"
	};
};
if({side _x == west && player distance _x < 400} count allPlayers == 0) then {[[player,false],"life_fnc_setRestrained",false,false] spawn life_fnc_MP;};
[[_target,"AmovPercMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn life_fnc_MP;

if(_wasCop && life_old_group != group player) then {[player] joinSilent life_old_group;life_old_group = grpNull;};
_target allowDamage true;
_target setVariable["restrained",nil,true];
_target setVariable["isCivRestrained",nil,true];
life_disable_actions = false;
life_abort_enabled = true;