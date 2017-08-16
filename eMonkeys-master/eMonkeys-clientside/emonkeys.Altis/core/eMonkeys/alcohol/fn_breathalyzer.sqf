/*file:fn_breathalyzer author:[midgetgrimm] descrip:allows cop to breathalyze player*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_drinky = EMonkeys_dr164;
_prom = EMonkeys_dr164 * 10;
if(_drinky > 0.07) then {
[[1,format["Alkoholtest %1 \n\n Promille: %2 \n\n Du bist bei oder über dem gesetzlichen Grenzwert! ",name player,_prom]],"EMonkeys_fnc_broadcast",_cop,false] call EMonkeys_fnc_mp;
} else {
[[1,format["Alkoholtest %1 \n\n Promille: %2 \n\n Unter dem gesetzlichen Grenzwert! ",name player,_prom]],"EMonkeys_fnc_broadcast",_cop,false] call EMonkeys_fnc_mp;
};