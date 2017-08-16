private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint "Recherche d'armes...";
uiSleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Vous ne pouvez pas fouiller cette personne."};
[[player],"life_fnc_removeWeapons",_unit,false] spawn life_fnc_MP;
life_action_encours = false;