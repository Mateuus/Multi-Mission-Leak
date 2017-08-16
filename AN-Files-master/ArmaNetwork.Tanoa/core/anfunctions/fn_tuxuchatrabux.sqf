/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_currentRank = param [0,0,[0]];
_costs = 0;
_maxMembers = 6 + (_currentRank - 1) * 2;
if (_currentRank <= 5) then {
	_costs = (getNumber(missionConfigFile >> "CfgGangs" >> "life_gang_upgrade")) * _currentRank * _maxMembers;
} else {
	_costs = (getNumber(missionConfigFile >> "CfgGangs" >> "life_gang_upgrade")) * (_maxMembers * 2);
};
_costs
