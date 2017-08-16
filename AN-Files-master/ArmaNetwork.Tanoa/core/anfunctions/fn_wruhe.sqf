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
  ["_data",[],[[]]]
];
if!(count _data isEqualTo 0) then {
  life_swatlevel = (_data select 0);
  life_cglevel = (_data select 1);
  life_asqlevel = (_data select 2);
  life_detective = (_data select 3);
};
life_swatlevel = compileFinal str(life_swatlevel);
life_cglevel = compileFinal str(life_cglevel);
life_asqlevel = compileFinal str(life_asqlevel);
life_detective = compileFinal str(life_detective);
call life_fnc_bebafacr;
SideInfo = true;
