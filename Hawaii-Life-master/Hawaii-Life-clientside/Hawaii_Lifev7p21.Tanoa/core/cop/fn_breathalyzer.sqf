/*
	file: fn_breathalyzer.sqf
	author:[midgetgrimm]
	descrip:allows cop to breathalyze player
*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

_drinky = life_drink;
if(_drinky > 0.07) then {
	[1,format["Teste %1 \n\n BAC: %2 \n\n Das ist mehr als das legale Limit! ",name player,[_drinky] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_cop];
} else {
	[1,format["Teste %1 \n\n BAC: %2 \n\n Unter dem legalen Limit! ",name player,[_drinky] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_cop];
};