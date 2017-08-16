/*
	File: fn_compRecieve.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Client ran file to receive comp from an admin
*/
private["_value"];

_value = _this select 0;

hint format ["An admin has comped $%1 into your bank account",_value];
systemchat format ["An admin has comped $%1 into your bank account",_value];

[_value,true,true] spawn DS_fnc_handleMoney;
[] call DS_fnc_compileData;