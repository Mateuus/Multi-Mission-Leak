private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if((player distance _unit > 3)) exitWith {titleText["Vous devez etre a moins de 3 metres","PLAIN"]};
if(!isPlayer _unit) exitWith {};
[player, "cuff", 5] call life_fnc_globalSound;
_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,format["%1 a été menotté par %2",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",west,false] spawn life_fnc_MP