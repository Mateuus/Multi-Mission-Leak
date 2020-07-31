
_item = param [0,false,[false]];

_complete = false;
_price = 1250;




if(_item) then {

	

} else {

	if(karma_level > 0) then {
		_mydiscount = karma_level / 100;
		_discount = 1 - _mydiscount;
		_price = _price * _discount;
		_discountper = _mydiscount * 100;
		[format["Otrzymales %%1 znizki dzieki Twojej reputacji!",_discountper], false] spawn domsg;
	};

	if(cheap_buffs) then { _price = _price * 0.7; cheap_buffs = false; ["Otrzymales 30% znizki dzieki kuponowi z banku!", false] spawn domsg; };

	if(cash_in_hand < _price) exitWith { ["PRACOWNIK: Nie masz wystarczajej ilosci pieniedzy, potrzebuje $1250.", false] spawn domsg;  _complete = true; };

	["cash","take",_price] call life_fnc_handleCash;
};

if(_complete) exitWith {};

["Ten donut ma duzo cukru! Dzieki takiej ilosci cukru we krwi, latwiej Ci sie celuje przez 90 minut!", false] spawn domsg;

life_bro = 0;
uiSleep 1;
life_bro = 5400;
player setUnitRecoilCoefficient 1.8;
while{life_bro > 0} do {
	life_bro = life_bro - 1;
	uiSleep 1;
};
["Twoj buff z donutow skonczyl sie", false] spawn domsg;
player setUnitRecoilCoefficient 2.8;