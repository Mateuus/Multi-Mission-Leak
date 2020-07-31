/*
File: bank teller payments
*/

if(has_job) exitwith { ["Juz masz prace! Nacisnij Shift + 4 aby sie zwolnic!", false] spawn domsg;};

if(side player != civilian) exitwith { ["Tylko dla cywili!", false] spawn domsg;  };
if(life_bankteller) exitWith {
["Juz jestes pracownikiem banku.", false] spawn domsg; 
};
if(uniform player find "KAEL_SUITS" isEqualTo -1) exitwith {
	["Potrzebujesz formalny garnitur aby tutaj pracowac.", false] spawn domsg; 
};

has_job = true;
life_bankteller = true;


["Otrzymujesz wyplate za stanie w poblizu banku.. jestes mobilnym bankomatem!", false] spawn domsg; 

_fkit = 45;
player setVariable["ATM_MAN", true, true];
while{_fkit > 0 && life_bankteller } do {
	uiSleep 60;

	if(isNull objectParent player && (player distance (getMarkerPos "bank_signup")) < 21) then {
		if(Uniform player == "KAEL_SUITS_BR_F12") then
		{
			["bank","add", 300] call life_fnc_handleCash;
			["Otrzymujesz premie w wysokosci $300", false] spawn domsg; 
		};
	};
	if((player distance (getMarkerPos "fed_reserve")) > 30) exitwith {

	};
	_fkit = _fkit - 1;
	if(_fkit == 5) then {
		["Twoja zmiana konczy sie za 5 minut..", false] spawn domsg; 
	};
};
life_bankteller = false;
player setVariable["ATM_MAN", nil, true];


["Twoja zmiana skonczyla sie!", false] spawn domsg; 

has_job = false;