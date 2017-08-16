

params [
["_ret",objNull,[objNull]]
];
if(isNull _ret OR {isNil "_ret"}) exitWith {};
_queryResult = ["FetchHitList",2,true] call DB_fnc_asyncCall;
if(count _queryResult isEqualTo 0) exitWith {};
_ret = owner _ret;












_new = [];
{
_entry = _x;
{
if (getPlayerUID(_entry) isEqualTo _x select 1) then {
_new pushBack [_x select 0, _x select 1, _x select 2, _x select 3, _x select 4, _entry];
};
} forEach _queryResult;
} forEach playableUnits;

if(count _new > 0) then {
[_new] remoteExecCall ["life_fnc_joapiubrouthoe",_ret];
};
