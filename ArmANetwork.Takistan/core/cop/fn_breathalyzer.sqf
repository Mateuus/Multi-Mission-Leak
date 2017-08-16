/*file:fn_breathalyzer author:[midgetgrimm] descrip:allows cop to breathalyze player*/
private["_unit","_drinky"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
_drinky = life_drink;
if(_drinky > 0.10) then {
  hint format["Breathalyzing %1 \n\n BAC: %2 \n\n They are at, or over the legal limit! ",name _unit,[_drinky] call life_fnc_numberText];
} else {
  hint format["Breathalyzing %1 \n\n BAC: %2 \n\n Under the legal limit! ",name _unit,[_drinky] call life_fnc_numberText];
};
