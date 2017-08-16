/*
	ArmA.Network
	Rathbone
	Receives Government Info from Server
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/

params [
  ["_info",[],[[]]],
  ["_mode",-1,[0]]
];

switch(_mode) do {
  case 0: {
    life_govCash = parseNumber(_info select 0);
    life_govPop = (_info select 1);
  };
  default {};
};
