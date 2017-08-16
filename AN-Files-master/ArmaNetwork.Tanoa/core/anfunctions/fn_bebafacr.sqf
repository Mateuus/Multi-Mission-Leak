switch(playerSide)do {
  case civilian: {
		life_paycheck = getNumber(missionConfigFile >> "CfgPaychecks" >> str(playerSide) >> "paycheck");
  };
  case west: {
    life_paycheck = getNumber(missionConfigFile >> "CfgPaychecks" >> str(playerSide) >> "levels" >> format["level_%1",call life_coplevel] >> "paycheck");
  };
  case independent: {
    life_paycheck = getNumber(missionConfigFile >> "CfgPaychecks" >> str(playerSide) >> "levels" >> format["level_%1",call life_medicLevel] >> "paycheck");
  };
};

if(call life_donatorlevel > 0) then {life_paycheck = life_paycheck * 2;};
life_paycheck = compileFinal str(life_paycheck);
