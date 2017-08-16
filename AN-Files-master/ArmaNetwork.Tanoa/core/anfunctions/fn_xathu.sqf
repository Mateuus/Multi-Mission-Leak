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
  life_asqmedic = (_data select 0);
};
life_asqmedic = compileFinal str(life_asqmedic);
call life_fnc_bebafacr;
SideInfo = true;
