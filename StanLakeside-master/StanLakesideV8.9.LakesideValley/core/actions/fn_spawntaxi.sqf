/*
File: taxi payments
*/
if(life_taxi) exitWith {["Juz pracujesz jako taksowkarz!", false] spawn domsg;};

if(has_job) exitwith { ["Juz posiadasz prace! Nacisnij Shift + 4 aby sie zwolnic!", false] spawn domsg;};

has_job = true;

life_taxi = true;
["Otrzymujesz pieniadze za podwozenie ludzi w taksowce!", false] spawn domsg;

_fkit = 45;
_payment = 0;

while{_fkit > 0 && life_taxi} do {
	uisleep 60;
	_fkit = _fkit - 1;

	if(vehicle player != player) then
		{
		if(driver (vehicle player) == player && typeOf (vehicle player) == "CG_Taxi") then {
			["bank","add", 350] call life_fnc_handleCash;
			["Otrzymujesz premie w wysokosci $350", false] spawn domsg; 
		};	
	};

	if(_fkit == 1) then {
		["Twoja zmiana za chwile sie skonczy", false] spawn domsg;
	};

};
life_taxi = false;
["Twoja zmiana skonczyla sie!", false] spawn domsg;
["Jezeli nadal chcesz pracowac, podejdz do punktu zapisow!", false] spawn domsg;
has_job = false;