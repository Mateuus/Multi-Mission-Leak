







private["_unit","_index"];
_unit = _this select 0;

_index = [(getPlayerUID _unit),life_wanted_list] call life_fnc_index;

if(_index != -1) then
{
life_wanted_list set[_index,-1];
life_wanted_list = life_wanted_list - [-1];
life_wanted = 0;
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_wanted";
[[getPlayerUID _unit],"life_fnc_removeBounty",true,false] spawn life_fnc_MP;

[getPlayerUID _unit] spawn DB_fnc_deleteWanted;

[[getPlayerUID _unit], "life_fnc_removeBounty",true,false] call life_fnc_MP;
};