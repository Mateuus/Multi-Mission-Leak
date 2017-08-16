/*file:fn_breathalyzer author:[midgetgrimm] descrip:allows cop to breathalyze player*/
private["_cop","_drinky"];
_cop = param [0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {};
_drinky = lhm_drink;
if(_drinky > 0.07) then {
[[1,format["Breathalyzing %1 \n\n BAC: %2 \n\n They are at, or over the legal limit! ",name player,[_drinky] call lhm_fnc_numberText]],"lhm_fnc_broadcast",_cop,false] call lhm_fnc_mp;
} else {
[[1,format["Breathalyzing %1 \n\n BAC: %2 \n\n Under the legal limit! ",name player,[_drinky] call lhm_fnc_numberText]],"lhm_fnc_broadcast",_cop,false] call lhm_fnc_mp;
};