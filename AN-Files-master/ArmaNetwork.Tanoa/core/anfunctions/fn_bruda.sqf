/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
life_nextExp = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1",life_level] >> "requiredExp");
