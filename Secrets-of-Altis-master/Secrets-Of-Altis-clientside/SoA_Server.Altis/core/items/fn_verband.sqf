/*
	fn_verband.sqf
	Author: G00golplexian
	
	Description: heals you from time to time...
*/

while{true} do {
	_damage = damage player;
	_damage = _damage - 0.01;
	player setdamage _damage;
	if(damage player == 0) exitWith{hint "Du fühlst dich schon besser!"};
sleep 5;
};