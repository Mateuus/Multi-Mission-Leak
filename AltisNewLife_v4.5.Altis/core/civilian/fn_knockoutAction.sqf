private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
#define SAFETY_ZONES    [["civ_spawn_1", 850], ["civ_spawn_3", 250]]
if ({player distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) exitWith {
	titleText["Pas de violence en safezone","PLAIN"];
};
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
uiSleep 0.08;
playSound "knockout";
[[_target,profileName],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;
uiSleep 3;
life_knockout = false;