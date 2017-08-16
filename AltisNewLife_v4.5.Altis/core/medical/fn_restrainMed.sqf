private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if((player distance _unit > 3)) exitWith {titleText["Vous devez etre a moins de 3 metres","PLAIN"]};
if(!isPlayer _unit) exitWith {};
_unit say3D "cuff";
_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrainActionMed", _unit, false] spawn life_fnc_MP;
[[0,format["%2 a mis une camisole a %1",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP