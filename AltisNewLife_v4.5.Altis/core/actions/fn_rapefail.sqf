private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
_target playMoveNow "Incapacitated";
uiSleep 3;
hint 'Le prisonier a reussi a se liberer durant votre tentative de viol !';
_target playMoveNow "amovppnemstpsraswrfldnon";
_target setdamage ((damage player)+.15);
