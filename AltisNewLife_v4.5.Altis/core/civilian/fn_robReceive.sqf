private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText["Il n'y avait pas d'argent...","PLAIN"]};
argent_liquide = argent_liquide + _cash;
titleText[format["Vous avez volé %1€",[_cash] call life_fnc_numberText],"PLAIN"];