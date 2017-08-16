private["_unit"];
_unit = cursorTarget;
if (!isPlayer _unit || !alive _unit || !(_unit getVariable ["restrained",false])) exitWith { hint "Vous ne pouvez pas mettre un sac sur la tête de votre cible !"; };
if(!([false,"sacpatate",1] call life_fnc_handleInv)) exitWith {};
hint format["Vous avez mis un sac sur la tête de %1.", name _unit];
[[player],"life_fnc_sacpatate",_unit,false] spawn life_fnc_MP;