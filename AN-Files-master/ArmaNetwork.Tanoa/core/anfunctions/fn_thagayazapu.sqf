/*
	ArmA.Network
	Author: Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
params [
	["_type",true,[false]],
	["_amount",0,[0]]
];

if !(playerSide isEqualTo civilian) exitWith {};
if (_amount isEqualTo 0) exitWith {};
if (_amount > 5000) exitWith {};
if(call life_donatorlevel > 0) then {_amount = _amount * 2};

if (life_exp < 0) then
{
	life_exp = 10;
};

if (_type) then
{
  	life_exp = life_exp + round (_amount * EXPEvent);
}
else
{
	 life_exp = life_exp - _amount;
};

call life_fnc_ceqetretret;
