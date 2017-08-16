







private["_unit","_type","_total"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_type = _this select 1;
_time = _this select 2;
if(isNull _unit) exitWith {};
_total = (_type select 1);
_index = [(getPlayerUID _unit),life_wanted_list] call life_fnc_index;
_newData = [];
if(_index != -1) then {
_data = life_wanted_list select _index;
_crimes = _data select 2;
_crimes set[count _crimes,(_type select 0)];
_val = _data select 3;
_jailTime = _data select 4;
_total = _total + _val;
_newData = [(name _unit),(getPlayerUID _unit),_crimes,(_type select 1) + _val,_jailTime + _time];
life_wanted_list set[_index,_newData];
} else {
_newData = [(name _unit),(getPlayerUID _unit),[(_type select 0)],(_type select 1),_time];
life_wanted_list set[count life_wanted_list,_newData];
};

life_wanted = _total;
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_wanted";

_newData spawn DB_fnc_insertWanted;