private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; // Not Valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "gagged")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit setVariable["gagged",true,true];
[[player],"life_fnc_gagged",_unit,false] spawn life_fnc_MP;
hint format["Vous avez bâillonné %1.", _unit getVariable["realname",_unit]];
life_inv_gagkit = life_inv_gagkit - 1;