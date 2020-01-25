/*
	File: fn_healHospital.sqf
	
	
	Description:
	Doesn't matter, will be revised later.
*/

if(cash_in_hand < 10) exitWith {[format[localize "STR_NOTF_HS_NoCash",10], false] spawn domsg;};
[localize "STR_NOTF_HS_Healing", false] spawn domsg;
uiSleep 8;
if(player distance (_this select 0) > 5) exitWith {[localize "STR_NOTF_HS_ToFar", false] spawn domsg;};
[localize "STR_NOTF_HS_Healed", false] spawn domsg;
["Set",0] call fnc_doHealth;

_price = 10;


	if(karma_level > 0) then {
		_mydiscount = karma_level / 100;
		_discount = 1 - _mydiscount;
		_price = _price * _discount;
		_discountper = _mydiscount * 100;
		[format["Otrzymales %%1 znizki dzieki Twojej reputacji!",_discountper], false] spawn domsg;
	};


	["cash","take",_price] call life_fnc_handleCash;

player setvariable["playerInjuries",[0,0,0,0,0,0,0,0,0,0,0],true];
player setvariable["playerInjuriesToUpdate",[0,0,0,0,0,0,0,0,0,0,0],false];

player forceWalk false;
player setVariable["severeInjuries", nil, true];