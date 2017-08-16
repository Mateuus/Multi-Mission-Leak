/*
	File: fn_buy.sqf
	Author: Skalicon
	
	Description:
	Handles buying anything
*/
private["_buy"];
_buyArray = _this select 3;
if (_buyArray select 0 == "insurance") then {
	if(life_atmmoney > 1000) then {
		["atm","take",1000] call life_fnc_uC;
		life_has_insurance = true;
	};
};