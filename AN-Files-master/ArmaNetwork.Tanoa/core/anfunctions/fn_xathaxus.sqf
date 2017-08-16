/*
 ArmA.Network
 RathBone
 Initializes majority of players public variables
*/

switch(playerSide) do {

  case west: {
    player setVariable ["restrained",false,true];
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    player setVariable ["realname",profileName,true];
    player setVariable ["eg_cancelRevive", false, true];
    player setVariable ["tf_unable_to_use_radio", false];
    player setVariable ["steam64id",(getPlayerUID player),true];
    player setVariable ["BloodLevel",5500,true];
  	player setVariable ["BleedRate",0,true];
  	player setVariable ["RegenRate",BaseRegenRate,true];
  	player setVariable ["CanAct",1,true];
  	player setVariable ["LifeState",0,true];
    player setVariable ["copLevel",1,true];
    player setVariable ["tazed",false,true];
    player setvariable ["out",false,true];
	player setVariable ["BAC",0,true];
    player addRating 99999999;
  };
  case civilian: {
    player setvariable ["out",false,true];
    player setVariable ["restrained",false,true];
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    player setVariable ["realname",profileName,true];
    player setVariable ["eg_cancelRevive",false,true];
    player setVariable ["tf_unable_to_use_radio",false];
    player setVariable ["steam64id",(getPlayerUID player),true];
    player setVariable ["BloodLevel",5500,true];
  	player setVariable ["BleedRate",0,true];
  	player setVariable ["RegenRate",BaseRegenRate,true];
  	player setVariable ["CanAct",1,true];
  	player setVariable ["LifeState",0,true];
    player setVariable ["life_is_arrested",nil,true];
    player setVariable ["copLevel",nil,true];
    player setVariable ["tazed",false,true];
	player setVariable ["BAC",0,true];
    player addRating 99999999;
  };
  case independent: {
    player setvariable ["out",false,true];
    player setVariable ["restrained",false,true];
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    player setVariable ["realname",profileName,true];
    player setVariable ["eg_cancelRevive", false, true];
    player setVariable ["tf_unable_to_use_radio",false];
    player setVariable ["steam64id",(getPlayerUID player),true];
    player setVariable ["BloodLevel",5500,true];
  	player setVariable ["BleedRate",0,true];
  	player setVariable ["RegenRate",BaseRegenRate,true];
  	player setVariable ["CanAct",1,true];
  	player setVariable ["LifeState",0,true];
    player setVariable ["copLevel",nil,true];
    player setVariable ["tazed",false,true];
	player setVariable ["BAC",0,true];
    player addRating 99999999;
  };
};
