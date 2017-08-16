/*
	File: fn_putInCar.sqf

	Description:
*/
private["_unit","_ nearest"];
_unit = cursorTarget;
_nearest = life_escort;
if(isNull _nearest) exitWith {}; //Not valid
if(!isPlayer _nearest || !alive _nearest) exitWith {systemChat "You can't put a dead body in your vehicle.  The upholstery will stink."};
if(((getPos _nearest) distance player) > 20) exitWith {};
if(!(_nearest getVariable ["restrained",false])) exitWith {systemChat "Can't put someone in a vehicle when they're not restrained."};
[[false],"life_fnc_setUnconscious",_nearest,false] spawn life_fnc_MP;
detach _nearest;
life_escort = objNull;
_nearest setVariable["Escorting",nil,true];
_nearest setVariable["transporting",true,true];
_nearest action ["getInCargo", _unit];
sleep 1;
{
	sleep 1;
	scopeName "positionLoop";
	if(vehicle player == player) then {
		_nearest action ["getInTurret", _unit, _x];
	} else {
		breakOut "positionLoop";
	};
} foreach [[1],[2],[3],[4]];
_unit setVariable["isTransporting",true,true];
player setVariable["currentlyEscorting",nil];

//[[player,"AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon_Putdown","playNow"],"life_fnc_animSync",true,false] spawn life_fnc_MP;d
