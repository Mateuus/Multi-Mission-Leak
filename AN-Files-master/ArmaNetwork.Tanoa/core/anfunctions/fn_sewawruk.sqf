/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
	["_amount",0,[0,""]],
	["_cashType",0,[0]],
	["_ecoType",0,[0]]
];

if(_amount isEqualTo 0 OR {_amount isEqualTo ""}) exitWith {};
if!(_cashType in [0,1]) exitWith {};
if!(_ecoType in [0,1]) exitWith {};
if(_amount isEqualType "") then {_amount = parseNumber(_amount);};

if((an_cash != ancash_box OR {an_bank != anbank_box}) && {(call life_adminlevel) < 1}) then {
	[profileName,(getPlayerUID player),(anbank_box - an_bank),(ancash_box - an_cash)] remoteExecCall ["life_fnc_sacha",-2];
};

switch(_cashType) do {
	case 0: {
		switch(_ecoType) do {
			case 0:{an_cash = an_cash + _amount;};
			case 1:{an_cash = an_cash - _amount;};
		};
	};
	case 1: {
		switch(_ecoType) do {
			case 0:{an_bank = an_bank + _amount;};
			case 1:{an_bank = an_bank - _amount;};
		};
	};
};
ancash_box = an_cash;
anbank_box = an_bank;
[6] call life_fnc_maphuwres;
