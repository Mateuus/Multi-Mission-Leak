/*
	File: fn_escortAction.sqf
*/
private["_unit"];

if (!isNull (player getVariable ["currentlyEscorting",objNull])) exitWith { hint "You can only escort one person at a time." };

_unit = cursorTarget;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
_unit attachTo [player,[0,1,0]];
_unit setVariable["transporting",nil,true];
_unit setVariable["Escorting",true,true];
_unit setVariable["escorted_by",[player,license_civ_bounty],true];
player setVariable["currentlyEscorting",_unit];
player reveal _unit;
if ((side player == civilian)&&(!(_unit getVariable ["isCivRestrained",false]))) then{serv_killed = [player,"141"]; publicVariableServer "serv_killed";};
// [[109, player, format["Escorting %1", name _unit]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;

[_unit] spawn
{
	_unit = _this select 0;
	waitUntil {(isNull (player getVariable["currentlyEscorting",objNull]) || !(_unit getVariable["Escorting",false]))};
	player setVariable["currentlyEscorting",nil];
};
_unit spawn {
	waitUntil {isNull attachedTo _this};
	if(_this getVariable["Escorting",false]) then {_this setVariable["Escorting",nil,true]};
};