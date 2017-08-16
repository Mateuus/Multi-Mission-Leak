private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"];
_pid = param [0,"",[""]];
_side = param [1,sideUnknown,[sideUnknown]];
_type = param [2,"",[""]];
_unit = param [3,ObjNull,[ObjNull]];


if(_pid isEqualTo "" OR {_side isEqualTo sideUnknown} OR {_type isEqualTo ""} OR {isNull _unit}) exitWith {};

_unit = owner _unit;
_side = switch(_side) do {
case west:{"cop"};
case civilian: {"civ"};
case independent: {"med"};
default {"Error"};
};
if(_side isEqualTo "Error") exitWith {};
_query = format["GetVehicles:%1:%2:%3",_pid,_side,_type];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(typeName _queryResult isEqualTo "STRING") exitWith {
[[]] remoteExecCall ["life_fnc_trurawegupeku",_unit];
};
[_queryResult] remoteExecCall ["life_fnc_trurawegupeku",_unit];