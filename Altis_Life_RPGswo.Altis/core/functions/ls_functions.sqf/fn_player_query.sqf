private["_ret"];
_ret = _this select 0;
if(isNull _ret) exitWith {};
if(isNil "_ret") exitWith {};
	
[dwf_atmcash,dwf_cash,owner player,player] remoteExec ["DWEV_fnc_admininfo",_ret];