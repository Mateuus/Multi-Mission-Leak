switch (playerSide) do {
	case west: {

		_xpNow = getNumber(missionConfigFile >> "CfgXP" >> "levels_COP" >> str(ES_xp_lvl) >> "xpNeeded");
		_xpNext = getNumber(missionConfigFile >> "CfgXP" >> "levels_COP" >> str(ES_xp_lvl + 1) >> "xpNeeded");
		_xp = (ES_xp_cop - _xpNow) / (_xpNext - _xpNow);
		_xp;

	};

	case independent: {

		_xpNow = getNumber(missionConfigFile >> "CfgXP" >> "levels_MED" >> str(ES_xp_lvl) >> "xpNeeded");
		_xpNext = getNumber(missionConfigFile >> "CfgXP" >> "levels_MED" >> str(ES_xp_lvl + 1) >> "xpNeeded");
		_xp = (ES_xp_med - _xpNow) / (_xpNext - _xpNow);
		_xp;

	};

	case civilian: {

		_xpNow = getNumber(missionConfigFile >> "CfgXP" >> "levels_CIV" >> str(ES_xp_lvl) >> "xpNeeded");
		_xpNext = getNumber(missionConfigFile >> "CfgXP" >> "levels_CIV" >> str(ES_xp_lvl + 1) >> "xpNeeded");
		_xp = (ES_xp_civ - _xpNow) / (_xpNext - _xpNow);
		_xp;

	};
	
	default { 

		_return = 0;
   		_return;

	};
};