private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
[[player], "life_fnc_therapie", _unit, false] spawn life_fnc_MP;
if(side player == independent) then
{
[[0,format["%1 est sorti de son probleme de drogue grace a %2 !",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;
};