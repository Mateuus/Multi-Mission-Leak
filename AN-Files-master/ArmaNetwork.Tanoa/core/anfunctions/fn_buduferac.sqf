/*
	ArmA.Network
	Rathbone
	Popularity of Current President
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_type = param[0,0,[0]];

if(life_popVot) exitWith {closeDialog 0;};

switch(_type)do {
  case 0: {
    life_popVot = true;
    [2] remoteExecCall ["life_fnc_updateGovDetails",2];
  };
  case 1: {
    life_popVot = true;
    [3] remoteExecCall ["life_fnc_updateGovDetails",2];
  };
  default {};
};
closeDialog 0;
