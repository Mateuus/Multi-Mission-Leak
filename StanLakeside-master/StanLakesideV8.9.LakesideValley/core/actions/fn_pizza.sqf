/*
Search Words: 
pizza
*/

_item = param [0,false,[false]];
_complete = false;
_price = 750;


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
	if(cash_in_hand < _price) exitWith { ["PRACOWNIK PIZZERII: Ta pizza kosztuje $750!", false] spawn domsg; _complete = true; };

	["cash","take",_price] call life_fnc_handleCash;

	
};

if(_complete) exitWith {};

["Add","Food",100] spawn fnc_sustain;

life_pizza = 0;
uiSleep 1.5;
life_pizza = 5400;

["Mmm, Pizza Riperino... teraz leczysz sie przez 90 minut!", false] spawn domsg;

while {life_pizza > 0} do {

	uiSleep 7;
	life_pizza = life_pizza - 7;
	if(!im_hurt) then {
		["Add",0.05] call fnc_doHealth;
	};
};


["Strawilem juz Pizze Riperino..", false] spawn domsg;

life_pizza = 0;