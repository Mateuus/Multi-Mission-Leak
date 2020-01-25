/*

	Description:
	Pulls civilians out of a car if it's stopped.
*/

["Ten pojazd zostanie zniszczony za 30 sekund..", false] spawn domsg;
_vehicle = cursorTarget;

if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "Bicycle") || (_vehicle isKindOf "Motorbike") || (_vehicle isKindOf "A3L_Tahoe_Base"))) exitWith {};

_vehdestroy = 30;

while{_vehdestroy > 0} do {
	if(player distance _vehicle >= 10) exitWith {
		["Auto nie zostalo zniszczone! Za bardzo sie oddaliles!", false] spawn domsg;
	};
	_vehdestroy = _vehdestroy - 1;
	uiSleep 1;
	hint format["To auto zostanie zniszczonez za %1 sekund",_vehdestroy];
};

if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "Bicycle") || (_vehicle isKindOf "Motorbike") || (_vehicle isKindOf "A3L_Tahoe_Base"))) exitWith {};

if(player distance _vehicle >= 10) exitWith {
	["Auto nie zostalo zniszczone! Za bardzo sie oddaliles!", false] spawn domsg;
};


_vehicle setdamage 1;

["Auto zniszczone!", false] spawn domsg;