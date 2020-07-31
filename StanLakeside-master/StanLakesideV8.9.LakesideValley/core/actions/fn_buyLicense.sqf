/*
	File: fn_buyLicense.sqf
	
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(cash_in_hand < _price) exitWith {[format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1], false] spawn domsg;};

if(karma_level > 0) then {
		_mydiscount = karma_level / 100;
		_discount = 1 - _mydiscount;
		_price = _price * _discount;
		_discountper = _mydiscount * 100;
		[format["Otrzymales %%1 znizki dzieki Twojej reputacji!",_discountper], false] spawn domsg;
};

["cash","take",_price] call life_fnc_handleCash;

[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText], false] spawn domsg;
missionNamespace setVariable[(_license select 0),true];
[2] call SOCK_fnc_updatePartial;