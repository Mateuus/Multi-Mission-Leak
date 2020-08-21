/*
file:fn_breathalyzer 
author:[midgetgrimm] 
descrip:allows cop to breathalyze player
*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_drinky = life_drink;

if(_drinky > 0.07) then {
	[1,format["Sprawdzam: %1 \n\n Promile: %2 \n\n Wykryto alkohol we krwi! ",name player,[_drinky] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",_cop];
} else {
	[1,format["Sprawdzam %1 \n\n Promile: %2 \n\n Nic nie wykryto! ",name player,[_drinky] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",_cop];
};
