private["_target"];
_target = cursorTarget;
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
#define SAFETY_ZONES    [["civ_spawn_1", 850], ["civ_spawn_3", 250]]
if ({player distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) exitWith {
	titleText["Pas de vols en safezone","PLAIN"];
};
if(_target getVariable["robbed",false]) exitWith {};
[[player],"life_fnc_robPerson",_target,false] spawn life_fnc_MP;
_target setVariable["robbed",TRUE,TRUE];