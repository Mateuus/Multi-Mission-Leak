private["_ret"];
_ret = _this select 0;
if(isNull _ret) exitWith {};
if(isNil "_ret") exitWith {};
[an_cash,an_bank,player] remoteExecCall ["life_fnc_brafa",_ret];
