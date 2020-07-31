_price = 250;

if(cash_in_hand < _price) exitWith {
	["Potrzebujesz $250 aby ruchac sie ze mna!", false] spawn domsg;
};



if(life_karma < 0) then {
	["Otrzymales %10 znizki za Twoja zla reputacje, mrr...", false] spawn domsg;
	_price = round(_price * 0.9);
	["cash","take",_price] call life_fnc_handleCash;	
} else {
	["cash","take",_price] call life_fnc_handleCash;
};


_chance = round (random 100);

if(life_std == 0) then {
	if(_chance > 55) then {

		["Gross, no protection!", false] spawn domsg;
		player setfatigue 1;
	};	
};

["Czujesz sie odprezony od seksu - latwiej Ci sie celuje przez 90 minut.", false] spawn domsg;
life_num = 0;
uiSleep 1;
life_num = 5400;
player setCustomAimCoef 0.35;
player setAnimSpeedCoef 1.1;
player enableFatigue false;
while{life_num > 0} do {
	life_num = life_num - 1;
	uiSleep 1;
	if(deadPlayer) exitWith {
		life_num = 0;
	};
};
player enableFatigue true;
["Twoje spelnienie seksualne minelo, zwal sobie konia!", false] spawn domsg;
player setAnimSpeedCoef 1;
player setCustomAimCoef 1;