private["_cop","_drinky","_drugy"]; 
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

_drinky = life_drink;
_drugy = life_drug; 

if(_drinky > 0.04) then {
[[1,format["Ethylotest sur %1 \n\n Taux : %2 \n\n Au dessus de la limite legale ! ",name player,[_drinky] call life_fnc_numberText]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
} else {
[[1,format["Ethylotest sur %1 \n\n Taux : %2 \n\n Sous la limite legale !",name player,[_drinky] call life_fnc_numberText]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
};

uiSleep 5;

if(_drugy > 0) then {
[[1,format["Droguetest %1 \n\n Taux: Positif \n\n Ce citoyen est sous l'effet de stupefiant ! ",name player]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
} else {
[[1,format["Droguetest %1 \n\n Taux: Negatif \n\n Ce citoyen est clean ! ",name player]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
}; 