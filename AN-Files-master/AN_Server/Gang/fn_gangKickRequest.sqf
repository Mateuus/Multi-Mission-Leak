_unit = param [0, ObjNull, [ObjNull]];
_group = param [1, grpNull, [grpNull]];
_unitId = getPlayerUID _unit;
_query = format["PlayerGangKicked:%1", _unitId];
[_query, 1] call DB_fnc_asyncCall;
[_group] remoteExecCall ["life_fnc_yaphajek", owner _unit];