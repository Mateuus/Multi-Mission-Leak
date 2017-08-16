

_object = _this;
_type = typeOf _object;
Jonas = 0.01;

sleep Jonas;
["Dein Helicopter wurde Voll getankt"] spawn life_fnc_nachricht;
while {fuel _object < 0.99} do {
	_object setFuel 1;
	sleep 0.01;
};
sleep Jonas;
if (true) exitWith {};
