/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Blacklisted
if("GTA_blacklisted" call GTA_fnc_const) exitWith {
  ["Blacklisted", false, 0] call BIS_fnc_endMission;
};

//--- Add rating
player addRating 99999999;
player addScore 99999999;

//--- Name tag
player setVariable ["nametag_title", profileName, true];

//--- Whitelisted ranks
switch true do {
  //--- Police
  case ([] call GTA_fnc_isCop): {
    player setVariable ["cop_rank", ["GTA_copRank"] call GTA_fnc_const, true];
  };

  //--- Police
  case ([] call GTA_fnc_isMilitary): {
    player setVariable ["mil_rank", ["GTA_milRank"] call GTA_fnc_const, true];
  };

  //--- Medic
  case ([] call GTA_fnc_isMedic): {
    player setVariable ["med_rank", ["GTA_medRank"] call GTA_fnc_const, true];
  };

  //--- HATO
  case ([] call GTA_fnc_isHATO): {
    player setVariable ["hato_rank", ["GTA_hatoRank"] call GTA_fnc_const, true];
  };
};

//--- Side specifc init
switch playerSide do {
  case west: {
    if ([] call GTA_fnc_isMilitary) then {
      [] call GTA_fnc_initMilitary;
    } else {
      [] call GTA_fnc_initCop;
    };

    //--- Hide unknown illegal areas
    {
      _x setMarkerAlphaLocal 0;
    } forEach ["oil_1", "weed_1", "heroin_1", "cocaine_1", "cocaine_2", "weed_area_1", "heroin_area_1", "cocaine_area_1", "cocaine_area_2", "cmeth_3", "launderer_1", "launderer_1_zone", "launderer_2", "launderer_2_zone", "gold_bar_dealer", "gold_bar_dealer_zone"];
  };

  case independent: {
    if ([] call GTA_fnc_isHATO) then {
      [] call GTA_fnc_initHATO;
    } else {
      [] call GTA_fnc_initMedic;
    };
  };

  case civilian: {
    [] call GTA_fnc_initCivilian;
  };
};
