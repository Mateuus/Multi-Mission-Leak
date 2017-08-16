/*
	ArmA.Network
	Rathbone
	Checks whether player is ready to be leveled up!
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_requiredExp = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1",life_level] >> "requiredExp");
_addedSP = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1",life_level] >> "receivedSkill");
_addedCash = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1",life_level] >> "receivedCash");
if(life_exp >= _requiredExp) then {
  life_level = life_level + 1;
  life_skillpoint = life_skillpoint + _addedSP;
  life_nextExp = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1",life_level] >> "requiredExp");
  if(!isNil "_addedCash") then {
    [_addedCash,1,0] call life_fnc_sewawruk;
  };
  ["LevelUp"] call life_fnc_notificationHandler;
  [10] call life_fnc_maphuwres;
};
