/*file:fn_breathalyzer author:[midgetgrimm] descrip:allows cop to breathalyze player*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_drinky = ES_drink;
if(_drinky > 0.07) then {
[[1,format["Breathalyzing %1 \n\n BAC: %2 \n\n They are at, or over the legal limit! ",name player,[_drinky] call ES_fnc_numberText]],"ES_fnc_broadcast",_cop,false] spawn ES_fnc_MP;
} else {
[[1,format["Breathalyzing %1 \n\n BAC: %2 \n\n Under the legal limit! ",name player,[_drinky] call ES_fnc_numberText]],"ES_fnc_broadcast",_cop,false] spawn ES_fnc_MP;
};