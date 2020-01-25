/*
	File: fn_buyClothes.sqf
	
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/

private["_price"];
if((lbCurSel 3101) isEqualTo -1) exitWith {[localize "STR_Shop_NoClothes", false] spawn domsg;};
_curTarget = cursorTarget;
_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > cash_in_hand) exitWith {[localize "STR_Shop_NotEnoughClothes", false] spawn domsg;};

if (typeOf _curTarget IN ["critgamin_vangmcc_clothing","critgamin_vangmcc_fedex","critgamin_vangmcc_food","critgamin_vangmcc_general"] && count crew _curTarget != 0) then {
	mobile_payment = _price * 0.7;
	_unit = (driver _curTarget);
 	_price = _price * 0.8;
 	["Otrzymales 20% znizki.", false] spawn domsg;
 	mobile_payment remoteExec ["fnc_totalmobile",_unit];
};

if(life_karma > 100) then {
	["Otrzymales 10% znizki za dobra reputacje!", false] spawn domsg;
	_price = _price * 0.9;
	["cash","take",round(_price)] call life_fnc_handleCash; 	
} else {
	["cash","take",round(_price)] call life_fnc_handleCash; 	
};

life_clothesPurchased = true;
closeDialog 0;
